import 'package:json_annotation/json_annotation.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

@JsonSerializable()
class User {
  int? id;
  String? username;
  String? email;
  String? password;
  String? description;

  // Constructor, with syntactic sugar for assignment to members.
  User({this.id, this.username, this.description, this.email, this.password});

  static Future<List> getData(username, pwd) async {
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$pwd'));
      Response response = await dio.post(
          "http://docketu.iutnc.univ-lorraine.fr:62364/auth",
          options:
              Options(headers: <String, dynamic>{'Authorization': basicAuth}));
      if (response.statusCode == 200) {
        List<dynamic> list = [
          {"token": response.data["token"]},
          {"refresh-token": response.data["refresh-token"]},
          {"user": response.data["user"]}
        ];
        if (response.data["token"] != null) {
          await prefs.setString('token', response.data["token"]);
        }
        if (response.data["refresh-token"] != null) {
          await prefs.setString(
              'refresh-token', response.data["refresh-token"]);
        }
        if (response.data["user"] != null) {
          //print(response.data["user"]);
          await prefs.setStringList("user", [
            response.data["user"]["id"].toString(),
            response.data["user"]["username"].toString(),
            response.data["user"]["email"].toString(),
            response.data["user"]["description"].toString()
          ]);
        }
        return list;
      } else {
        return [
          {"message": "Connexion Impossible"}
        ];
      }
    } catch (e) {
      //print(e);
      return [
        {"message": "Connexion Impossible"}
      ];
    }
  }
}
