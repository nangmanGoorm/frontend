// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class Chatting extends StatefulWidget {
//   const Chatting({super.key});

//   @override
//   State<Chatting> createState() => _ChattingState();
// }

// class _ChattingState extends State<Chatting> {
//   late IO.Socket socket;
//   String socketServerURL = '';

//   @override
//   void initState() {
//     initSocket();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     socket.disconnect();
//     socket.dispose();
//     super.dispose();
//   }

//   initSocket() {
//     socket = IO.io(socketServerURL, <String, dynamic>{
//       'autoConnect': false,
//       'transports': ['websocket'],
//     });
//     socket.connect();
//     socket.onConnect((_) {
//       print('Connection established');
//     });
//     socket.onDisconnect((_) => print('Connection Disconnection'));
//     socket.onConnectError((err) => print(err));
//     socket.onError((err) => print(err));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
