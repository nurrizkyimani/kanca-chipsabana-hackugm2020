import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tinder_clone/Models/tinder_clone_icons.dart';
import 'package:tinder_clone/Screens/MessagesTab.dart';
import 'package:tinder_clone/Screens/ProfileTab.dart';
import 'package:tinder_clone/Screens/TinderTab.dart';
import 'package:tinder_clone/Screens/ProfilePageDesign.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      new ProfilePageDesign(),
      new TinderTab(),
      new MessagesTab()
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Tinder_clone.iconfinder_icons_user2_1564535),
        title: Text('Profile'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Tinder_clone.iconfinder_338_tinder_logo_4375488__1_),
        title: Text('Match'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Tinder_clone.iconfinder_message_01_186393),
        title: Text('Messages'),
      ),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.orangeAccent,
      unselectedItemColor: Colors.grey,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
        appBar: AppBar(title: Text('Talents')),
        body: Center(child: _listPage[_selectedTabIndex]),
        bottomNavigationBar: _bottomNavBar);
  }
}
