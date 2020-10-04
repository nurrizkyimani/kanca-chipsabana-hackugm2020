import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class ProjectProfile extends StatefulWidget {
  @override
  _ProjectProfileState createState() => _ProjectProfileState();
}

class _ProjectProfileState extends State<ProjectProfile> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  TextStyle _style() {
    return TextStyle(fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "About This Project",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Programer wannabe",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Interest",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text("Machine Learning"),
            SizedBox(
              height: 16,
            ),
            Text(
              "Location",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text("Yogyakarta, Indonesia"),
            SizedBox(
              height: 16,
            ),
            Text(
              "Skills",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text("Python, Machine Learning"),
            SizedBox(
              height: 16,
            ),
            Text(
              "Occupation",
              style: _style(),
            ),
            SizedBox(
              height: 4,
            ),
            Text("Employee"),
            SizedBox(
              height: 16,
            ),
            Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

final String url =
    "http://chuteirafc.cartacapital.com.br/wp-content/uploads/2018/12/15347041965884.jpg";

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size(double.infinity, 320);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 25),
        decoration: BoxDecoration(color: Colors.blueAccent, boxShadow: [
          BoxShadow(color: Colors.red, blurRadius: 20, offset: Offset(0, 0))
        ]),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Spacer(),
                Column(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  new AssetImage('assets/images/project.png'))),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      "Virtual Hack Project",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 16,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  print("//TODO: button clicked");
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 145, 0),
                  child: Transform.rotate(
                    angle: (math.pi * 2.00),
                    child: Container(
                      width: 120,
                      height: 32,
                      child: Center(
                        child: Text("+ Add a Project"),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 20)
                          ]),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height - 20);
    p.lineTo(size.width, size.height - 20);

    p.lineTo(size.width, 0);

    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
