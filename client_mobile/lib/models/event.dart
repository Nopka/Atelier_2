import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  String? id;
  String titre;
  String description;
  String? date;
  String lieu;
  String idCreateur;
  String? token;
  String? createdAt;
  String? updateAt;

  // Constructor, with syntactic sugar for assignment to members.
  Event({
      this.id,
      required this.titre,
      required this.description,
      this.date,
      required this.lieu,
      required this.idCreateur,
      this.token,
      this.createdAt,
      this.updateAt
    });

  /// Connect the generated function to the `fromJson`
  /// factory.
  //factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  /// Connect the generated function to the `toJson` method.
  //Map<String, dynamic> toJson() => _$EventToJson(this);
}
