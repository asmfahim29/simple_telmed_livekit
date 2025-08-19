// import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:developer';
// import 'package:permission_handler/permission_handler.dart';
// import './call.dart';
//
// class IndexPage extends StatefulWidget {
//   const IndexPage({super.key});
//
//   @override
//   State<IndexPage> createState() => _IndexPageState();
// }
//
// class _IndexPageState extends State<IndexPage> {
//   final _channelController = TextEditingController();
//   late var _validateError = false;
//
//   ClientRole? _role = ClientRole.Broadcaster;
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _channelController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Agora"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Image.asset("assets/images/doctor.jpg"),
//             SizedBox(
//               height: 20,
//             ),
//             TextField(
//               controller: _channelController,
//               decoration: InputDecoration(
//                 labelText: "Channel Name",
//                 errorText:
//                     _validateError ? "Please enter a channel name" : null,
//                 // hintText: "Channel name",
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             RadioListTile(
//               title: Text("Boradcaster"),
//               value: ClientRole.Broadcaster,
//               groupValue: _role,
//               onChanged: (ClientRole? value) {
//                 setState(() {
//                   _role = value;
//                 });
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             RadioListTile(
//               title: Text("Audience"),
//               value: ClientRole.Audience,
//               groupValue: _role,
//               onChanged: (ClientRole? value) {
//                 setState(() {
//                   _role = value;
//                 });
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: onJoined,
//               child: Text("Join Room"),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> onJoined() async {
//     setState(() {
//       _channelController.text.isEmpty
//           ? _validateError = true
//           : _validateError = false;
//     });
//
//     if (_channelController.text.isNotEmpty) {
//       await _handleCameraAndMic(Permission.camera);
//       await _handleCameraAndMic(Permission.microphone);
//
//       await Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (_) => CallPage(
//                     channelName: _channelController.text,
//                     role: _role,
//                   )));
//     }
//   }
//
//   Future<void> _handleCameraAndMic(Permission permission) async {
//     final status = await permission.request();
//
//     switch (status) {
//       case PermissionStatus.granted:
//         break;
//       case PermissionStatus.denied:
//       case PermissionStatus.restricted:
//       case PermissionStatus.permanentlyDenied:
//         openAppSettings();
//       case PermissionStatus.limited:
//       // TODO: Handle this case.
//       case PermissionStatus.provisional:
//       // TODO: Handle this case.
//     }
//   }
// }
