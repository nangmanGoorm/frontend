class Bottle {
  num? id;
  String? category;
  String? message;
  String? createdAt;
  num? offer;

  Bottle({this.id, this.category, this.message, this.createdAt, this.offer});

  static String categoryNumToString(int categoryNum) {
    List<String> categoryString = [
      '제주샌애기',
      '신애라',
      '내꿈은 제주시장',
      '이두산(애월게하)',
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
