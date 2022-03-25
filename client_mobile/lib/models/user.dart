import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? username;
  String? email;
  String? password;
  String? description;

  // Constructor, with syntactic sugar for assignment to members.
  User({this.id, this.username, this.description, this.email, this.password});

  /// Connect the generated function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
