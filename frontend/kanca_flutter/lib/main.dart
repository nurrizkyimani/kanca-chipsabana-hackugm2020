import 'package:flutter/material.dart';
import 'MatchCard.dart'

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo', 
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title:'Kanca Card Stack'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> cardList;

  void _removeCard(index){
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState(){
    super.initState();
    cardList = _getMatchCard();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: cardList,
          ),
        ),
    );
  }