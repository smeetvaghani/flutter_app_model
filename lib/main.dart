import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app_model/Services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  getUserData() async {
    await Services.getUsers().then((value) {
     // value.userList.map((e) => log(e.title));
      value.userList.forEach((element) {
        log(element.title);
      });
    }, onError: (e) {
      log("error in calling $e");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FlatButton(
        onPressed: () {
          getUserData();
        },
        child: Center(child: Text("call")),
      ),
    );
  }
}
