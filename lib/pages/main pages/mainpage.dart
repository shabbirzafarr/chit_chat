import 'package:chit_chat/pages/database/data.dart';
import 'package:chit_chat/pages/main%20pages/chat.dart';
import 'package:chit_chat/pages/main%20pages/profile.dart';
import 'package:chit_chat/pages/main%20pages/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  List<Widget> body=[chat(),search(),profile()];
  List<String> title=["Chat","Search","Profile"];
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(title[_selectedIndex])),elevation: 0.0,backgroundColor: Color(0xff769CFF),),
      
      body: body[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        height: 55,
          animationCurve: Curves.linear,
          selectedIndex: _selectedIndex,
          iconSize: 30,
          showElevation: false, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.home_filled),
              title: Text('Home'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.person_2),
              title: Text('Profile'),
            ),
          ],
        ),
      );
  }
}