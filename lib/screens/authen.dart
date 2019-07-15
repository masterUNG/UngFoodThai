import 'package:flutter/material.dart';
import 'package:ung_foodthai/screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit

  // Method
  Widget signInButton() {
    return RaisedButton(
      color: Colors.pinkAccent[200],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget signUpButton() {
    return OutlineButton(
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.pinkAccent[700]),
      ),
      onPressed: () {
        print('You Click Sign Up');

        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
            Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInButton(),
          ),
          mySizeBox(),
          Expanded(
            child: signUpButton(),
          ),
        ],
      ),
    );
  }

  Widget userText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'User :',
          labelStyle: TextStyle(color: Colors.pinkAccent[700]),
          hintText: 'Not Blank',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.pinkAccent[700]),
          hintText: 'Not Blank',
        ),
      ),
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      height: 16.0,
      width: 8.0,
    );
  }

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
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: Colors.pinkAccent[700],
        fontFamily: 'DancingScript',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple[300], Colors.purple[50]],
            begin: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            mySizeBox(),
            showAppName(),
            userText(),
            passwordText(),
            mySizeBox(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
