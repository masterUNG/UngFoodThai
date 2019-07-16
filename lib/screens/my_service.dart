import 'package:flutter/material.dart';
import 'package:ung_foodthai/models/food_model.dart';
import 'package:ung_foodthai/models/user_model.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

import 'package:ung_foodthai/screens/detail_food.dart';

class MyService extends StatefulWidget {
  final UserModel userModel;
  MyService({Key key, this.userModel}) : super(key: key);

  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  UserModel userModel;
  List<FoodModel> foodModels = [];

  // Method
  @override
  void initState() {
    super.initState();
    userModel = widget.userModel;
    // print('Name = ${userModel.Name}');
    readAllData();
  }

  Future<void> readAllData() async {
    String url = 'https://www.androidthai.in.th/ooo/getAllFood.php';

    var response = await get(url);
    var result = json.decode(response.body);
    print('result =========================== $result');

    for (var myParseJSON in result) {
      FoodModel foodModel = FoodModel.formJSON(myParseJSON);
      setState(() {
        foodModels.add(foodModel);
      });
    }
  }

  Widget showTitle() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text('My Service'),
    );
  }

  Widget showUser() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        '${userModel.Name} Login',
        style: TextStyle(
          fontSize: 16.0,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget titleAppBar() {
    return Column(
      children: <Widget>[
        showTitle(),
        showUser(),
      ],
    );
  }

  Widget showImage(int index) {
    return Container(
      width: 180.0,
      height: 150.0,
      margin: EdgeInsets.all(6.0),
      child: Image.network(
        foodModels[index].ImagePath,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showNameFood(int index) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      alignment: Alignment.topRight,
      child: Text(
        foodModels[index].NameFood,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.purple[700],
        ),
      ),
    );
  }

  Widget showDetailFood(int index) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      alignment: Alignment.topLeft,
      child: Text(detailShort(foodModels[index].Detail)),
    );
  }

  String detailShort(String detailString) {
    String result = detailString;

    if (detailString.length >= 70) {
      result = detailString.substring(0, 70);
      result = '$result ...';
    }

    return result;
  }

  Widget showText(int index) {
    return Expanded(
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            showNameFood(index),
            showDetailFood(index),
          ],
        ),
      ),
    );
  }

  Widget showListView() {
    return ListView.builder(
      itemCount: foodModels.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: <Widget>[
                showImage(index),
                showText(index),
              ],
            ),
          ),
          onTap: () {
            var detailRoute = MaterialPageRoute(
                builder: (BuildContext context) => DetailFood(
                      foodModel: foodModels[index],
                    ));
                    Navigator.of(context).push(detailRoute);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        title: titleAppBar(),
      ),
      body: showListView(),
    );
  }
}
