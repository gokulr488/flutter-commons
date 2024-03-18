class JsonSerializable {
  JsonSerializable();

  factory JsonSerializable.fromRawJson(String json) => JsonSerializable();
  String toRawJson() => '';
}
