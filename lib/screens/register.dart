import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String name, user, password;

  // Method
  Widget nameText() {
    return TextFormField(
      style: TextStyle(color: Colors.green[900]),
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: Colors.green[700],
        ),
        labelText: 'Name :',
        labelStyle: TextStyle(color: Colors.green[700]),
        helperText: 'Type Display Name',
        helperStyle: TextStyle(
          color: Colors.green[200],
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name in Blank';
        }
      },onSaved: (String value){
        name = value;
      },
    );
  }

  Widget userText() {
    return TextFormField(
      style: TextStyle(color: Colors.blue[900]),
      decoration: InputDecoration(
        icon: Icon(
          Icons.account_circle,
          size: 36.0,
          color: Colors.blue[700],
        ),
        labelText: 'User :',
        labelStyle: TextStyle(color: Colors.blue[700]),
        helperText: 'Type User Name',
        helperStyle: TextStyle(
          color: Colors.blue[200],
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill User';
        }
      },onSaved: (String value){
        user = value;
      },
    );
  }

  Widget paswordText() {
    return TextFormField(
      style: TextStyle(color: Colors.purple[900]),
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.purple[700],
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(color: Colors.purple[700]),
        helperText: 'Type Password',
        helperStyle: TextStyle(
          color: Colors.purple[200],
          fontStyle: FontStyle.italic,
        ),
      ),validator: (String value){
        if (value.isEmpty) {
          return 'Please Type Password';
        }
      },onSaved: (String value){
        password = value;
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Click Upload');

        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name = $name, user = $user, password = $password');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Register'),
        actions: <Widget>[
          uploadButton(),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              nameText(),
              userText(),
              paswordText(),
            ],
          ),
        ),
      ),
    );
  }
}
