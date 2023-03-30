class User {
  num? id;
  String? nickname;
  String? type;
  num? location;
  String? category;

  User({this.id, this.nickname, this.type, this.location, this.category});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson['id'],
      nickname: parsedJson['nickname'],
      type: parsedJson['type'],
      location: parsedJson['location'],
      category: parsedJson['category'],
    );
  }
}
