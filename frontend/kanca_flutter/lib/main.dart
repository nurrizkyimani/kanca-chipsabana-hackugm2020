import 'package:flutter/material.dart';
import 'package:tinder_clone/Screens/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KANCA',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(255, 165, 0, 1.0),
          secondaryHeaderColor: Color.fromRGBO(255, 140, 0, 1.0),
          accentColor: Color.fromRGBO(255, 165, 0, 1.0)),
      home: SplashScreen(),
    );
  }
}
