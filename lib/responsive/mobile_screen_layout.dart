import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/screens/add_post_screen.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/global_variables.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  late PageController _pageController;
  @override
  void initState() {
    // Provider.of<UserProvider>(context, listen: false).refreshUser();
    super.initState();
    _pageController=PageController();
  }

  

  navigationTapped(int page){
    _pageController.jumpToPage(page);
  }

  onPageChanged(int page){
    setState(() {
      _page=page;
    });
  }

  int _page = 0;
  @override
  Widget build(BuildContext context) {
    // User? user = Provider.of<UserProvider>(context).getUser;
    // if (user == null) {
    //   return const CircularProgressIndicator();
    // }
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        controller: _pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        
        onTap: navigationTapped,
        backgroundColor:mobileBackgroundColor,
        items: [

        //feeds button
        BottomNavigationBarItem(
            icon: Icon(
          Icons.home,
          color: _page == 0 ? primaryColor : secondaryColor,
        )),
        
        //search button
        BottomNavigationBarItem(
            icon: Icon(
          Icons.search_sharp,
          color: _page == 1 ? primaryColor : secondaryColor,
        )),

        //add a post button
        BottomNavigationBarItem(
            icon: Icon(
          Icons.add_circle_outline,
          color: _page == 2 ? primaryColor : secondaryColor,
        )),

        //notifications 
        BottomNavigationBarItem(
            icon: Icon(
          Icons.notifications,
          color: _page == 3 ? primaryColor : secondaryColor,
        )),

        //profile button
        BottomNavigationBarItem(
            icon: Icon(
          Icons.person,
          color: _page == 4 ? primaryColor : secondaryColor,
        )),

      ]),
    );
  }
}
