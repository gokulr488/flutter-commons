import 'dart:convert';

class SearchBy {
  SearchBy({
    this.columnName,
    this.keyword,
  });

  factory SearchBy.fromRawJson(String str) =>
      SearchBy.fromJson(json.decode(str));

  factory SearchBy.fromJson(Map<String, dynamic> json) => SearchBy(
        columnName: json['columnName'],
        keyword: json['keyword'],
      );

  String? columnName;
  String? keyword;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'columnName': columnName,
        'keyword': keyword,
      };
}
