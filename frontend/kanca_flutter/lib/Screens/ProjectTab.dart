import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tinder_clone/Models/PeopleList.dart';
import 'package:tinder_clone/Widgets/MatchCard.dart';

class ProjectTab extends StatefulWidget {
  @override
  _ProjectTabState createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab>
    with SingleTickerProviderStateMixin {
  bool chng = true;
  bool atCenter = true;
  bool _triggerNotFound = false;
  bool _timeout = false;
  CardController _cardController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new AnimatedContainer(
          duration: new Duration(milliseconds: 600),
          curve: Curves.fastLinearToSlowEaseIn,
          color: !atCenter
              ? chng ? Colors.pinkAccent.shade200 : Colors.tealAccent.shade200
              : Colors.blue.shade50,
          child: new Center(
            child: _triggerNotFound
                ? !_timeout
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new CircularProgressIndicator(),
                          new SizedBox(
                            height: ScreenUtil().setHeight(30.0),
                          ),
                          new Text(
                            "Searching nearby matchings ...",
                            style: new TextStyle(
                                fontSize: ScreenUtil().setSp(60.0),
                                fontWeight: FontWeight.w200,
                                color: Colors.grey.shade600),
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new SizedBox(
                            height: ScreenUtil().setHeight(550.0),
                          ),
                          new ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: new Image(
                                width: ScreenUtil().setWidth(400),
                                height: ScreenUtil().setWidth(400),
                                fit: BoxFit.cover,
                                image: new AssetImage(
                                    'assets/images/jevoned.png')),
                          ),
                          new SizedBox(
                            height: ScreenUtil().setHeight(40.0),
                          ),
                          new Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(60.0)),
                            child: new Text(
                                "There is no one new around you ...",
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    wordSpacing: 1.2,
                                    fontSize: ScreenUtil().setSp(55.0),
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey.shade600)),
                          )
                        ],
                      )
                : Container(),
          ),
        ),
        new Align(
            alignment: Alignment.topCenter,
            child: new TinderSwapCard(
              animDuration: 800,
              orientation: AmassOrientation.TOP,
              totalNum: peoples.length,
              stackNum: 3,
              swipeEdge: 10.0,
              maxWidth: MediaQuery.of(context).size.width - 10.0,
              maxHeight: MediaQuery.of(context).size.height * 0.74,
              minWidth: MediaQuery.of(context).size.width - 50.0,
              minHeight: MediaQuery.of(context).size.height * 0.73,
              cardBuilder: (context, index) {
                return peoples[index];
              },
              cardController: _cardController,
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {
                /// Get swiping card's alignment
                if (align.x < 0) {
                  //Card is LEFT swiping
                  print("Left align " + align.x.toString());
                  setState(() {
                    if (align.x < -1) atCenter = false;
                    chng = true;
                  });
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                  print("right align " + align.x.toString());
                  setState(() {
                    if (align.x > 1) atCenter = false;
                    chng = false;
                  });
                }
              },
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {
                /// Get orientation & index of swiped card!
                setState(() {
                  atCenter = true;
                  if (index == peoples.length - 1) {
                    _triggerNotFound = true;
                    Future.delayed(Duration(seconds: 5), () {
                      _timeout = true;
                      setState(() {});
                    });
                  }
                });
              },
            )),
      ],
    );
  }

  double abs(double x) {
    if (x < 0) return x * -1;
    return x;
  }
}
