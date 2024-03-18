import 'dart:convert';

import 'package:talos_commons/base_classes/json.dart';

class BasePacket implements JsonSerializable {
  BasePacket({required this.packetType, required this.payload, this.sessionId});
  factory BasePacket.fromJson(Map<String, dynamic> json) => BasePacket(
        packetType: json['packetType'],
        payload: json['payload'],
      );

  @override
  factory BasePacket.fromRawJson(String str) =>
      BasePacket.fromJson(json.decode(str));

  String packetType;
  String payload;
  String? sessionId;

  @override
  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'packetType': packetType,
        'payload': payload,
        'sessionId': sessionId,
      };
}
