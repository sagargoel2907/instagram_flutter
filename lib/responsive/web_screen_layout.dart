import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/models/user.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<UserProvider>(context).getUser;
    return  Scaffold(
      body: Center(
        child: user == null
            ? const CircularProgressIndicator()
            : Text(user.userName),
      ),
    );
  }
}
