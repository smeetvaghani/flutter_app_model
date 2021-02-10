import 'dart:convert';

class UserModelClass {
  List<User> userList = [];

  UserModelClass(this.userList);

  factory UserModelClass.fromJson(List list) => UserModelClass(
        list.map((e) => User.fromJson(e)).toList(),
      );
}

class User {
  int userId;
  String title;
  String body;

  User({this.title, this.body, this.userId});

  factory User.fromJson(Map<String, dynamic> userJson) => User(
      body: userJson["body"] as String,
      title: userJson["title"] as String,
      userId: userJson["userId"] as  int);
}
