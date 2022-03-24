import 'package:json_annotation/json_annotation.dart';

//part 'task.g.dart';

@JsonSerializable()
class Event {
  int? id;
  String titre;
  String description;
  DateTime date;
  String lieu;
  String idCreateur;
  String? token;
  DateTime? createdAt;
  DateTime? updateAt;

  // Constructor, with syntactic sugar for assignment to members.
  Event(
      {this.id,
      required this.titre,
      required this.description,
      required this.date,
      required this.lieu,
      required this.idCreateur,
      this.token,
      this.createdAt,
      this.updateAt});

  /// Connect the generated function to the `fromJson`
  /// factory.
  //factory Event.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  /// Connect the generated function to the `toJson` method.
  //Map<String, dynamic> toJson() => _$TaskToJson(this);
}
