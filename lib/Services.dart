import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_model/UserModelClass.dart';

Dio dio = new Dio();
String API_URL = "https://jsonplaceholder.typicode.com/";

class Services {

  //dio.........
  static Future<UserModelClass> getUsers() async {
    String url = "https://jsonplaceholder.typicode.com/posts";

    Response response = await dio.get(url);
    try {
      if (response.statusCode == 200) {
        List jsonList = response.data;
        UserModelClass userData = UserModelClass.fromJson(jsonList);
        return userData;
      } else
        log("status code error -> ${response}");
    } catch (e) {
      log("error -> $e");
    }
  }

  //dio post api....................
  static Future<List> postForList({api_name, body}) async {
    String url = API_URL + '$api_name';
    print("$api_name url : " + url);

    //dio data send  through formdata..........
    var body = FormData.fromMap({
      "name":"a",
      "id":1,
    });

    var response;
    try {
      if (body == null) {
        response = await dio.post(url);
      } else {
        response = await dio.post(url, data: body);
      }

      if (response.statusCode == 200) {
        List list = [];
        print("$api_name Response: " + response.data.toString());
        var responseData = response.data;
        list = responseData;
        return list;
      } else {
        print("error ->" + response.data.toString());
        throw Exception(response.data.toString());
      }
    } catch (e) {
      print("error -> ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  //dio get api...................
  static Future<List> getForList({api_name, body}) async {
    String url = API_URL + '$api_name';
    print("$api_name url : " + url);
    var response;
    try {
      if (body == null) {
        response = await dio.get(url);
      } else {
        response = await dio.get(url, queryParameters: body);
      }
      if (response.statusCode == 200) {
        List list = [];
        print("$api_name Response: " + response.data.toString());
        var responseData = response.data;
          list = responseData;
        return list;
      } else {
        print("error ->" + response.data.toString());
        throw Exception(response.data.toString());
      }
    } catch (e) {
      print("error -> ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  //......................................................http.................................................................

  //http............
  static Future<UserModelClass> getUsers2() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        List jsonList = json.decode(response.body);
        UserModelClass userData = UserModelClass.fromJson(jsonList);
        return userData;
      } else
        log("status code error -> ${response}");
    } catch (e) {
      log("error -> $e");
    }
  }

  //http post api................
  static Future<List> postForList2({api_name, body}) async {
    String url = API_URL + '$api_name';
    print("$api_name url : " + url);

    //send data to server in post api............
    var body = {
      "aa":"a",
    };

    var response;
    try {
      if (body == null) {
        response = await http.post(url);
      } else {
        response = await http.post(url, body: body);
      }
      if (response.statusCode == 200) {
        List list = [];
        var responseData = response.data;
        list = responseData;
        return list;
      } else {
        print("error ->" + response.data.toString());
        throw Exception(response.data.toString());
      }
    } catch (e) {
      print("error -> ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  //http get api.........
  static Future<List> getForList2({api_name, body}) async {
    String url = API_URL + '$api_name';
    print("$api_name url : " + url);
    var response;
    try {
      if (body == null) {
        response = await http.get(url);
      } else {
        response = await http.get(url);
      }
      if (response.statusCode == 200) {
        List list = [];
        var responseData = response.data;
        list = responseData;
        return list;
      } else {
        print("error ->" + response.data.toString());
        throw Exception(response.data.toString());
      }
    } catch (e) {
      print("error -> ${e.toString()}");
      throw Exception(e.toString());
    }
  }

}
