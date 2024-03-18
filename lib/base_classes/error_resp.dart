import 'dart:convert';

class ErrorResp {
  factory ErrorResp.fromRawJson(String str) =>
      ErrorResp.fromJson(json.decode(str));

  ErrorResp({
    this.statusCode,
    this.status,
    this.error,
  });

  factory ErrorResp.fromJson(Map<String, dynamic> json) => ErrorResp(
        statusCode: json['statusCode'],
        status: json['status'],
        error: json['error'] == null ? null : Error.fromJson(json['error']),
      );
  final int? statusCode;
  final bool? status;
  final Error? error;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'status': status,
        'error': error?.toJson(),
      };
}

class Error {
  Error({
    this.errorId,
    this.errorMessage,
    this.errorDescription,
  });

  factory Error.fromRawJson(String str) => Error.fromJson(json.decode(str));

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        errorId: json['errorId'],
        errorMessage: json['errorMessage'],
        errorDescription: json['errorDescription'],
      );
  final int? errorId;
  final String? errorMessage;
  final String? errorDescription;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'errorId': errorId,
        'errorMessage': errorMessage,
        'errorDescription': errorDescription,
      };
}
