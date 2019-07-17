import 'package:flutter/material.dart';
import 'package:ung_foodthai/models/user_model.dart';
import 'package:ung_foodthai/screens/my_service.dart';
import 'package:ung_foodthai/screens/register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String user, password;

  // Method
  Widget signInButton() {
    return RaisedButton(
      color: Colors.pinkAccent[200],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          autentication();
        }
      },
    );
  }

  Future<void> autentication() async {
    String urlString =
        'https://www.androidthai.in.th/ooo/getUserWhereUserMaster.php?isAdd=true&User=$user';
    var response = await get(urlString);
    var result = json.decode(response.body);

    if ((result.toString()) == 'null') {
      print('User False');
      myAlertDialog('User False', 'No $user in my Database');
    } else {
      print('User True result = $result');

      for (var myParseJSON in result) {
        UserModel userModel = UserModel.parseJSON(myParseJSON);

        String truePassword = userModel.Password;
        if (password == truePassword) {
          // Password True
          var myServiceRoute = MaterialPageRoute(
              builder: (BuildContext context) => MyService(
                    userModel: userModel,
                  ));
          Navigator.of(context).pushAndRemoveUntil(
              myServiceRoute, (Route<dynamic> route) => false);
        } else {
          // Password False
          myAlertDialog('Password False', 'Please Try Agains Password False');
        }
      }
    }
  }

  void myAlertDialog(String titleString, String messageString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleString,
            style: TextStyle(color: Colors.red),
          ),
          content: Text(messageString),
          actions: <Widget>[alertButton()],
        );
      },
    );
  }

  Widget alertButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
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
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Type User !';
          }
        },
        onSaved: (String value) {
          user = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.pinkAccent[700]),
          hintText: 'Not Blank',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Type Password';
          }
        },
        onSaved: (String value) {
          password = value;
        },
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
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Ung FoodThai',
      style: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        color: Colors.pinkAccent[700],
        fontFamily: 'DancingScript',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: showLogo(),
            ),
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
