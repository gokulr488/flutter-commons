import 'package:talos_commons/base_classes/json.dart';
import 'package:talos_commons/base_classes/base_packet.dart';

class WsUtils {
  static String buildJson(JsonSerializable jsonObject, String packetType) {
    String json = jsonObject.toRawJson();
    json.replaceAll('"', '\\"');
    BasePacket packet = BasePacket(packetType: packetType, payload: json);
    return packet.toRawJson();
  }

  static BasePacket getBasePacket(String json) {
    BasePacket basePacket = BasePacket.fromRawJson(json);
    basePacket.payload = basePacket.payload.replaceAll('\\"', '"');
    return basePacket;
  }
}
