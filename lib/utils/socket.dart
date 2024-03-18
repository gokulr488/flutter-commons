class Socket {
  void init() {}
  void subscribe(String destination, Function(String json) onData,
      {Function()? onDone, Function(Object error)? onError}) {}
  void send(String data) {}
  void close() {}
}
