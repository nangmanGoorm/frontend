class MentorBottle {
  num? id;
  String? category;
  String? message;
  String? createdAt;
  num? offer;

  MentorBottle({this.id, this.category, this.message, this.createdAt, this.offer});

  static String categoryNumToString(int categoryNum) {
    List<String> categoryString = [
      '재주샌애기',
      '신애라',
      '내꿈은 제주시장',
      '이두산(애월게하)',
    ];
    return categoryString[categoryNum];
  }

  static String dateTimeToString(String createdAt) {
    final parsedDateTime = DateTime.parse(createdAt.toString());
    String dataTimeString = parsedDateTime.year.toString() +
        '.' +
        parsedDateTime.month.toString() +
        '.' +
        parsedDateTime.day.toString();
    return dataTimeString;
  }

  factory MentorBottle.fromJson(Map<String, dynamic> parsedJson) {
    return MentorBottle(
      id: parsedJson['id'],
      category: categoryNumToString(parsedJson['category']),
      message: parsedJson['message'],
      createdAt: dateTimeToString(parsedJson['createdAt']),
      offer: parsedJson['offer'],
    );
  }
}
