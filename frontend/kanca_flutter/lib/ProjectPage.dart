import 'package:flutter/material.dart';

import 'package:tinder_clone/Models/tinder_clone_icons.dart';
import 'package:tinder_clone/Models/my_flutter_app_icons.dart';
import 'package:tinder_clone/Screens/MessagesTab.dart';

import 'package:tinder_clone/Screens/TinderTab.dart';
import 'package:tinder_clone/Screens/ProjectProfile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      new ProjectProfile(),
      new TinderTab(),
      new MessagesTab()
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Tinder_clone.iconfinder_icons_user2_1564535),
        title: Text('Profile'),
      ),
      BottomNavigationBarItem(
        icon: Icon(MdiIcons.puzzle),
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
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.blueAccent, title: Text('Project')),
        body: Center(child: _listPage[_selectedTabIndex]),
        bottomNavigationBar: _bottomNavBar);
  }
}
