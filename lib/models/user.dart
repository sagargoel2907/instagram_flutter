class User {
  final String userName;
  final String email;
  final String uid;
  final String bio;
  final List following;
  final List followers;
  final String imageUrl;

  User({
    required this.userName,
    required this.email,
    required this.uid,
    required this.bio,
    required this.following,
    required this.followers,
    required this.imageUrl,
  });

  User.fromMap(Map<String, dynamic> userData)
      : userName = userData["userName"],
        email = userData["email"],
        bio = userData["bio"],
        uid = userData["uid"],
        followers = userData["followers"],
        following = userData["following"],
        imageUrl = userData["imageUrl"];

  Map<String, dynamic> get fromJson => {
        "email": email,
        "userName": userName,
        "uid": uid,
        "bio": bio,
        "following": [],
        "followers": [],
        "imageUrl": imageUrl,
      };
}
