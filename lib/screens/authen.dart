import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit

  // Method

  Widget showLogo() {
    return Container(
      width: 160.0,
      height: 160.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Ung FoodThai',
      style: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        color: Colors.pinkAccent[700],fontFamily: 'DancingScript',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            showAppName(),
          ],
        ),
      ),
    );
  }
}
