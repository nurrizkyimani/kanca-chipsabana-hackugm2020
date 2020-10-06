import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<dynamic>> fetchProject() async {
  final response = await http.get(
      'https://us-central1-backend-hackugm.cloudfunctions.net/getprojects');

  print(response);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> post = jsonDecode(response.body);
    return post;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class MatchCard extends StatefulWidget {
  final String name;
  final String imageURL;
  final int age;
  final String bio;

  MatchCard(@required this.name, @required this.imageURL, @required this.age,
      @required this.bio);

  @override
  _MatchCardState createState() => _MatchCardState();
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String about;
  final String location;
  final List<Tag> tags;
  final String imageUrl;

  const ProjectCard(
      {Key key,
      this.title,
      this.about,
      this.location,
      this.tags,
      this.imageUrl})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProjectCardState();

  factory ProjectCard.fromJson(Map<String, dynamic> json) {
    return ProjectCard(
      title: json['id'],
      about: json['about'],
      location: json['location'],
      tags: json['tags'],
      imageUrl: json['imageUrl'],
    );
  }
}

class Tag {
  final String userid;
  Tag(this.userid);
}

class _ProjectCardState extends State<ProjectCard> {
  Future<List<dynamic>> futureProject;

  @override
  void initState() {
    super.initState();

    futureProject = fetchProject();
    print(futureProject);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureProject,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Container(
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
              color: Colors.grey.shade700,
              offset: new Offset(0.0, 5.0),
              blurRadius: 20.0)
        ],
        borderRadius: new BorderRadius.circular(100.0),
      ),
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              boxShadow: [
                new BoxShadow(
                    color: Colors.grey.shade700,
                    offset: new Offset(0.0, 5.0),
                    blurRadius: 15.0)
              ],
              borderRadius: new BorderRadius.circular(100.0),
            ),
            height: MediaQuery.of(context).size.height * 0.74,
            width: MediaQuery.of(context).size.width - 10.0,
            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(10.0),
              child: new Image(
                  fit: BoxFit.cover, image: new AssetImage(widget.imageUrl)),
            ),
          ),
          new Positioned(
            bottom: ScreenUtil().setHeight(40.0),
            left: ScreenUtil().setWidth(40.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      widget.title,
                      style: new TextStyle(
                          shadows: [
                            new Shadow(
                                color: Colors.black54,
                                offset: new Offset(1.0, 2.0),
                                blurRadius: 10.0)
                          ],
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(95.0),
                          fontWeight: FontWeight.w800),
                    ),
                    new SizedBox(
                      width: ScreenUtil().setWidth(40.0),
                    ),
                    new Text(
                      widget.location.toString(),
                      style: new TextStyle(
                          shadows: [
                            new Shadow(
                                color: Colors.black54,
                                offset: new Offset(1.0, 2.0),
                                blurRadius: 10.0)
                          ],
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(70.0),
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                new SizedBox(
                  height: ScreenUtil().setHeight(10.0),
                ),
                new Text(
                  widget.about,
                  style: new TextStyle(
                      color: Colors.white,
                      shadows: [
                        new Shadow(
                            color: Colors.black54,
                            offset: new Offset(1.0, 2.0),
                            blurRadius: 10.0)
                      ],
                      fontSize: ScreenUtil().setSp(55.0),
                      fontWeight: FontWeight.w400),
                ),
                new Text(
                  widget.title,
                  style: new TextStyle(
                      color: Colors.white,
                      shadows: [
                        new Shadow(
                            color: Colors.black54,
                            offset: new Offset(1.0, 2.0),
                            blurRadius: 10.0)
                      ],
                      fontSize: ScreenUtil().setSp(55.0),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          new Positioned(
            bottom: 1.0,
            right: -1.0,
            child: new Container(
              width: MediaQuery.of(context).size.width - 22.0,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  gradient: new LinearGradient(
                      colors: [Colors.transparent, Colors.black26],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0])),
            ),
          )
        ],
      ),
    );
        
  });

    
  }
}

class _MatchCardState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
              color: Colors.grey.shade700,
              offset: new Offset(0.0, 5.0),
              blurRadius: 20.0)
        ],
        borderRadius: new BorderRadius.circular(100.0),
      ),
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              boxShadow: [
                new BoxShadow(
                    color: Colors.grey.shade700,
                    offset: new Offset(0.0, 5.0),
                    blurRadius: 15.0)
              ],
              borderRadius: new BorderRadius.circular(100.0),
            ),
            height: MediaQuery.of(context).size.height * 0.74,
            width: MediaQuery.of(context).size.width - 10.0,
            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(10.0),
              child: new Image(
                  fit: BoxFit.cover, image: new AssetImage(widget.imageURL)),
            ),
          ),
          new Positioned(
            bottom: ScreenUtil().setHeight(40.0),
            left: ScreenUtil().setWidth(40.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      widget.name,
                      style: new TextStyle(
                          shadows: [
                            new Shadow(
                                color: Colors.black54,
                                offset: new Offset(1.0, 2.0),
                                blurRadius: 10.0)
                          ],
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(95.0),
                          fontWeight: FontWeight.w800),
                    ),
                    new SizedBox(
                      width: ScreenUtil().setWidth(40.0),
                    ),
                    new Text(
                      widget.age.toString(),
                      style: new TextStyle(
                          shadows: [
                            new Shadow(
                                color: Colors.black54,
                                offset: new Offset(1.0, 2.0),
                                blurRadius: 10.0)
                          ],
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(70.0),
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                new SizedBox(
                  height: ScreenUtil().setHeight(10.0),
                ),
                new Text(
                  widget.bio,
                  style: new TextStyle(
                      color: Colors.white,
                      shadows: [
                        new Shadow(
                            color: Colors.black54,
                            offset: new Offset(1.0, 2.0),
                            blurRadius: 10.0)
                      ],
                      fontSize: ScreenUtil().setSp(55.0),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          new Positioned(
            bottom: 1.0,
            right: -1.0,
            child: new Container(
              width: MediaQuery.of(context).size.width - 22.0,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  gradient: new LinearGradient(
                      colors: [Colors.transparent, Colors.black26],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0])),
            ),
          )
        ],
      ),
    );
  }
}
