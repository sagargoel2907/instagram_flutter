import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_flutter/models/user.dart' as model;
import 'package:instagram_flutter/resources/storage_methods.dart';

class AuthMethods {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<model.User> getUserDetails() async {
    User user = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection("users/").doc(user.uid).get();

    // return model.User()
    return model.User.fromMap(snap.data() as Map<String, dynamic>);
  }

  //signup user function
  static Future<String> signUpUser({
    required String email,
    required String userName,
    required String password,
    required String bio,
    required Uint8List? file,
  }) async {
    String res = "Some error occurred!";
    try {
      if (email.isNotEmpty &&
          userName.isNotEmpty &&
          password.isNotEmpty &&
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // print(cred.user!.uid);

        String imageUrl = await StorageMethods.uploadImageToStorage(
            "profilePics", file, false);

        model.User user = model.User(
          userName: userName,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          imageUrl: imageUrl,
          uid: cred.user!.uid,
        );

        await _firestore
            .collection("users/")
            .doc(cred.user!.uid)
            .set(user.fromJson);

        res = "Success";
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        res = "The email address is badly formatted.";
      } else if (error.code == "weak-password") {
        res = "The password must be of atleast 8 characters";
      }
    } catch (error) {
      // print(error.toString());
      res = error.toString();
    }
    // print(res);
    return res;
  }

  //login user function
  static Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some Error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Success";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
