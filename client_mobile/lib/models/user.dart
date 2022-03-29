import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  int? id;
  String username;
  String email;
  String password;
  String description;

  // Constructor, with syntactic sugar for assignment to members.
  User(
      {this.id,
      required this.username,
      required this.description,
      required this.email,
      required this.password});
}
