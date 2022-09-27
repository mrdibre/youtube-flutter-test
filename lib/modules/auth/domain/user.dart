class User {
  late String _id;
  late String _name;
  late String _email;
  late String _profilePicture;

  User({ required String id, required String name, required String email, String profilePicture = "" }) {
    _id = id;
    _name = name;
    _email = email;
    _profilePicture = profilePicture;
  }

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      profilePicture: json["profilePicture"]
    );
  }

  toMap() {
    return {
      "id": _id,
      "name": _name,
      "email": _email,
      "profilePicture": _profilePicture
    };
  }

  String get id => _id;
  String get name => _name;
  String get email => _email;
}