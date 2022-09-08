class Users {
  Users(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.colorNumber});

  String? id;
  String? name;
  String? email;
  int colorNumber;
  String? phone;

  factory Users.fromJson(Map json) => Users(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      colorNumber: json['Color']);

  Map<String, Object?> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        'Color': colorNumber
      };
}
