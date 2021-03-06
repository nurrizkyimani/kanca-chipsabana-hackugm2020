import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinder_clone/Models/tinder_clone_icons.dart';
import 'package:tinder_clone/HomePage.dart';
import 'package:tinder_clone/ProjectPage.dart';
import 'package:tinder_clone/Screens/ProjectTab.dart';
import 'package:tinder_clone/Screens/TinderTab.dart';

class SwitchProfile extends StatefulWidget {
  @override
  _SwitchProfileState createState() => _SwitchProfileState();
}

class _SwitchProfileState extends State<SwitchProfile> {
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Theme.of(context).accentColor,
                    Theme.of(context).secondaryHeaderColor,
                    Theme.of(context).primaryColor
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.35, 1.0])),
          child: new Column(
            children: <Widget>[
              new Expanded(
                  flex: 5,
                  child: Center(
                      child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new SizedBox(width: ScreenUtil().setWidth(10.0)),
                      new Text(
                        "KANCA",
                        style: new TextStyle(
                            fontSize: ScreenUtil().setSp(140.0),
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )
                    ],
                  ))),
              new Expanded(
                  flex: 3,
                  child: new Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(75.0)),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          width: double.infinity,
                          height: ScreenUtil().setHeight(105.0),
                          child: new RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0)),
                            color: Colors.white,
                            elevation: 0.0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProjectPage()));
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "I want to find talent ",
                                  style: new TextStyle(
                                      color: Colors.grey, wordSpacing: 1.2),
                                )
                              ],
                            ),
                          ),
                        ),
                        new SizedBox(height: ScreenUtil().setHeight(30.0)),
                        new Container(
                          width: double.infinity,
                          height: ScreenUtil().setHeight(105.0),
                          child: new RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0)),
                            color: Colors.white,
                            elevation: 0.0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "I want to find project",
                                  style: new TextStyle(
                                      color: Colors.grey, wordSpacing: 1.2),
                                )
                              ],
                            ),
                          ),
                        ),
                        new SizedBox(height: ScreenUtil().setHeight(70.0)),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
