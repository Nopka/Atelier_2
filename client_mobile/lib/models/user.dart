import 'package:json_annotation/json_annotation.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';

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
      String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$pwd'));
      Response response = await dio.post(
          "http://docketu.iutnc.univ-lorraine.fr:62364/auth",
          options:
              Options(headers: <String, dynamic>{'Authorization': basicAuth}));
      if (response.statusCode == 200) {
        List<dynamic> list = [
          {"access-token": response.data["access-token"]},
          {"refresh-token": response.data["refresh-token"]}
        ];
        return list;
      } else {
        return [
          {"message": "blup"}
        ];
      }
    } catch (e) {
      print(e);
      return [
        {"message": e}
      ];
    }
  }
}
