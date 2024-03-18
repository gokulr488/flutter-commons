// To parse this JSON data, do
//
//     final baseResp = baseRespFromJson(jsonString);

import 'dart:convert';

class BaseResp {
  BaseResp({
    required this.statusCode,
    required this.status,
    this.errorMessage,
    this.errorDescription,
  });
  factory BaseResp.fromRawJson(String str) =>
      BaseResp.fromJson(json.decode(str));

  factory BaseResp.fromJson(Map<String, dynamic> json) => BaseResp(
        statusCode: json['statusCode'],
        status: json['status'],
        errorMessage: json['errorMessage'],
        errorDescription: json['errorDescription'],
      );

  int statusCode;
  bool status;
  String? errorMessage;
  dynamic errorDescription;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'status': status,
        'errorMessage': errorMessage,
        'errorDescription': errorDescription,
      };
}
