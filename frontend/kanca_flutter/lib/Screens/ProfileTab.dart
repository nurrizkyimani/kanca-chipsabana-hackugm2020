import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade100,
        ),
        new ClipPath(
          clipBehavior: Clip.antiAlias,
          clipper: new MyClipper(),
          child: new Container(
            height: MediaQuery.of(context).size.height * 0.725,
            decoration: new BoxDecoration(color: Colors.white, boxShadow: [
              new BoxShadow(
                  color: Colors.grey,
                  offset: new Offset(1.0, 10.0),
                  blurRadius: 10.0)
            ]),
            child: new Column(
              children: <Widget>[
                new Expanded(
                  flex: 4,
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new SizedBox(height: ScreenUtil().setHeight(50.0)),
                        new ClipRRect(
                          borderRadius: BorderRadius.circular(500.0),
                          child: new Image(
                              fit: BoxFit.cover,
                              height: ScreenUtil().setHeight(350.0),
                              width: ScreenUtil().setWidth(430.0),
                              image:
                                  new AssetImage('assets/images/jevoned.png')),
                        ),
                        new SizedBox(height: ScreenUtil().setHeight(10.0)),
                        new Text(
                          "Jevon Edmund, 20",
                          style: new TextStyle(
                              letterSpacing: 1.1,
                              fontSize: ScreenUtil().setSp(70),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                new Expanded(flex: 3, child: new Container())
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final Shader linearGradient = new LinearGradient(
        colors: [Colors.amber.shade800, Colors.amber.shade600],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.0, 1.0])
    .createShader(Rect.fromLTWH(
        0.0, 0.0, ScreenUtil().setWidth(30), ScreenUtil().setHeight(20)));

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(0, size.height - ScreenUtil().setHeight(200));
    Offset controlPoint = new Offset(size.width / 2, size.height);
    p.quadraticBezierTo(controlPoint.dx, controlPoint.dy, size.width,
        size.height - ScreenUtil().setHeight(200));
    //p.lineTo(size.width,size.height - ScreenUtil().setHeight(200) );
    p.lineTo(size.width, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
