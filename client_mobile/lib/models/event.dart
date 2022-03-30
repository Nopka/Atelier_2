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
  Event(
      {this.id,
      required this.titre,
      required this.description,
      this.date,
      required this.lieu,
      required this.idCreateur,
      this.token,
      this.createdAt,
      this.updateAt});
}
