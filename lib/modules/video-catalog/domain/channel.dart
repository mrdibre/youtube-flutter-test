class Channel {
  late String _id;
  late String _name;
  late String _profilePicture;

  Channel({ required String id, required String name, required String profilePicture }) {
    _id = id;
    _name = name;
    _profilePicture = profilePicture;
  }

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'],
      name: json['name'],
      profilePicture: json['profilePicture']
    );
  }

  String get id => _id;
  String get name => _name;
  String get profilePicture => _profilePicture;
}