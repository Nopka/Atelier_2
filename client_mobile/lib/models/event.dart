import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Event {
  int? id;
  String? titre;
  String? description;
  DateTime? date;
  String? lieu;
  String? idCreateur;
  String? token;
  DateTime? createdAt;
  DateTime? updateAt;

  // Constructor, with syntactic sugar for assignment to members.
  Event(
      {this.id,
      this.titre,
      this.description,
      this.date,
      this.lieu,
      this.idCreateur,
      this.token,
      this.createdAt,
      this.updateAt});
}
