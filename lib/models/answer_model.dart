class Answer {
  num? id;
  num? user_id;
  num? bottle_id;
  String? messages;

  Answer({this.id, this.user_id, this.bottle_id, this.messages});

  factory Answer.fromJson(Map<String, dynamic> parsedJson) {
    return Answer(
      id: parsedJson['id'],
      user_id: parsedJson['user_id'],
      bottle_id: parsedJson['bottle_id'],
      messages: parsedJson['messages'],
    );
  }
}
