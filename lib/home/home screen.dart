import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:telemed/pages/prejoin.dart';
import 'package:telemed/pages/room.dart';
import 'package:telemed/service_class/doctor_patient_list.dart';
import 'package:telemed/service_class/live_kit_call.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int remainingMinutes = 60;

  void handleSessionEnd() {
    setState(() {
      remainingMinutes -= 5;
    });
  }

  // Sample token and websocket URL
  // final String token = liveKitTOKEN;
  final String token = liveKitApiSecret;
  final String wsUrl = liveKitWebUrl;



  final String doctorToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTI3MzIyODcsImlzcyI6IkFQSXo0RWdVNG1TRXJ6RSIsIm5iZiI6MTc1MjczMTM4Nywic3ViIjoiZG9jdG9yXzAwMSIsInZpZGVvIjp7ImNhblB1Ymxpc2giOnRydWUsImNhblB1Ymxpc2hEYXRhIjp0cnVlLCJjYW5TdWJzY3JpYmUiOnRydWUsInJvb20iOiJBRE5NZWV0Iiwicm9vbUpvaW4iOnRydWV9fQ.fvVYi1_kiPFXlhWJ8w8W_FZl3G3YjJuVUO_nkmeAKro";
  final String patientToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTI3MzIzMDksImlzcyI6IkFQSXo0RWdVNG1TRXJ6RSIsIm5iZiI6MTc1MjczMTQwOSwic3ViIjoicGF0aWVudF8wMDEiLCJ2aWRlbyI6eyJjYW5QdWJsaXNoIjp0cnVlLCJjYW5QdWJsaXNoRGF0YSI6dHJ1ZSwiY2FuU3Vic2NyaWJlIjp0cnVlLCJyb29tIjoiQUROTWVldCIsInJvb21Kb2luIjp0cnVlfX0.WlzeJdUbMrHO2jr4yvXXdWl_WJjz7DD0JH_cb96NtH8";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Join Room')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildJoinCard(context, 'Doctor', doctorToken),
            const SizedBox(height: 20),
            _buildJoinCard(context, 'Patient', patientToken),
          ],
        ),
      ),
    );
  }

  Widget _buildJoinCard(BuildContext context, String role, String token) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('$role', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _connect(context, token),
              child: const Text('Join'),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _connect(BuildContext ctx, String token) async {
  //   try {
  //     const url = liveKitWebUrl; // Or hardcode if needed
  //     await Navigator.push(
  //       ctx,
  //       MaterialPageRoute(
  //         builder: (_) => PreJoinPage(
  //           args: JoinArgs(
  //             url: url,
  //             token: token,
  //             e2ee: false,
  //             e2eeKey: "demo",
  //             simulcast: false,
  //             adaptiveStream: true,
  //             dynacast: true,
  //             preferredCodec: "VP9",
  //             enableBackupVideoCodec: ['VP9', 'AV1'].contains("VP9"),
  //           ),
  //         ),
  //       ),
  //     );
  //   } catch (e) {
  //     print("Join error: $e");
  //   }
  // }

  Future<void> _connect(BuildContext ctx, String token) async {
    final room = Room();

    try {
      await room.connect(
        liveKitWebUrl,
        token,
        roomOptions: const RoomOptions(
          adaptiveStream: true,
          dynacast: true,
          defaultAudioPublishOptions: AudioPublishOptions(
            name: 'custom_audio_track_name',
          ),
          // defaultCameraCaptureOptions: const CameraCaptureOptions(
          //     maxFrameRate: 30,
          //     params: VideoParameters(
          //       dimensions: VideoDimensions(1280, 720),
          //       encoding: VideoEncoding(
          //         maxBitrate: 1000000, // 1 Mbps, adjust as needed
          //         maxFramerate: 30,
          //       ),
          //     ),
          // ),
          // defaultScreenShareCaptureOptions: const ScreenShareCaptureOptions(
          //     useiOSBroadcastExtension: true,
          //     params: VideoParameters(
          //       dimensions: VideoDimensionsPresets.h1080_169,
          //       encoding: VideoEncoding(
          //         maxBitrate: 1000000, // 1 Mbps, adjust as needed
          //         maxFramerate: 30,
          //       ),
          //     ),
          // ),
          defaultVideoPublishOptions: VideoPublishOptions(
            simulcast: false,
            videoCodec: "VP9",
            backupVideoCodec: BackupVideoCodec(
              enabled: true,
            ),
            videoEncoding: VideoEncoding(maxFramerate: 1000, maxBitrate: 30),
            // screenShareEncoding: screenEncoding,
          ),
        ),
      );

      final listener = room.createListener();

      await Navigator.push(
        ctx,
        MaterialPageRoute(builder: (_) => RoomPage(room, listener)),
      );
    } catch (e) {
      print('❌ Failed to connect: $e');
    }
  }


}
