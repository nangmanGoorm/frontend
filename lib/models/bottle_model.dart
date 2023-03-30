class Bottle {
  num? id;
  String? category;
  String? message;
  String? createdAt;
  num? offer;

  Bottle({this.id, this.category, this.message, this.createdAt, this.offer});

  static String categoryNumToString(int categoryNum) {
    List<String> categoryString = [
      '농사',
      '어업',
      '카페&베이커리',
      '숙박업',
      '식당',
      '편집샵',
      '프리랜서',
      '유통업'
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

  factory Bottle.fromJson(Map<String, dynamic> parsedJson) {
    return Bottle(
      id: parsedJson['id'],
      category: categoryNumToString(parsedJson['category']),
      message: parsedJson['message'],
      createdAt: dateTimeToString(parsedJson['createdAt']),
      offer: parsedJson['offer'],
    );
  }
}
