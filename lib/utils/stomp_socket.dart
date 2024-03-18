// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:screenersui/websocket/core/Socket.dart';
// import 'package:stomp_dart_client/stomp.dart';
// import 'package:stomp_dart_client/stomp_config.dart';
// import 'package:stomp_dart_client/stomp_frame.dart';

// class StompSocket implements Socket {
//   StompSocket({required this.baseUrl}) {
//     if (stompClient == null) {
//       init();
//       stompClient?.activate();
//     }
//   }

//   final String baseUrl;

//   StompClient? stompClient;
//   late StompFrame frame;

//   @override
//   void subscribe(String destination, Function(String json) onData) {
//     stompClient?.subscribe(
//       destination: destination, //'/topic/test/subscription'
//       callback: (frame) {
//         String body = json.decode(frame.body!);
//         debugPrint(body);
//         onData(body);
//       },
//     );
//   }

//   @override
//   void init() {
//     stompClient = StompClient(
//       config: StompConfig(
//         url: baseUrl,
//         onConnect: onConnect,
//         beforeConnect: () async {
//           debugPrint('connecting to websocket :$baseUrl ...');
//         },
//         onWebSocketError: (dynamic error) {
//           debugPrint(error.toString());
//         },
//         //stompConnectHeaders: {'Authorization': 'Bearer yourToken'},
//         //webSocketConnectHeaders: {'Authorization': 'Bearer yourToken'},
//       ),
//     );
//   }

//   void onConnect(StompFrame frame) {
//     debugPrint('connected to websocket');
//     this.frame = frame;
//     // Timer.periodic(Duration(seconds: 10), (_) {
//     //   stompClient.send(
//     //     destination: '/app/test/endpoints',
//     //     body: json.encode({'a': 123}),
//     //   );
//     // });
//   }

//   @override
//   void send(String data) {
//     //ODO: implement send
//   }

//   @override
//   void close() {
//     stompClient?.deactivate();
//   }
// }
