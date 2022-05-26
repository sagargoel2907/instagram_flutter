import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/models/user.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get getUser => _user;

  Future<void> refreshUser()async {
    _user=await AuthMethods.getUserDetails();
    notifyListeners(); 
  }
}
