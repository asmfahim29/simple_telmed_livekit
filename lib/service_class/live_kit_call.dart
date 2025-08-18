import 'dart:async';
import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';

class LiveKitCallScreen extends StatefulWidget {

  final String token;

  final String wsUrl;

  final VoidCallback onSessionEnd;

  const LiveKitCallScreen({
    super.key,
    required this.token,
    required this.wsUrl,
    required this.onSessionEnd,
  });

  @override
  State<LiveKitCallScreen> createState() => _LiveKitCallScreenState();
}

class _LiveKitCallScreenState extends State<LiveKitCallScreen> {
  late Room _room;
  bool _connected = false;
  int _remainingSeconds = 300;
  Timer? _sessionTimer;

  @override
  void initState() {
    super.initState();
    _connectToRoom();
  }

  Future<void> _connectToRoom() async {
    _room = Room();
    try {
      await _room.connect(widget.wsUrl, widget.token);
      await _room.localParticipant?.setCameraEnabled(true);
      await _room.localParticipant?.setMicrophoneEnabled(true);
      _startSessionTimer();
      setState(() => _connected = true);
    } catch (e) {
      print('❌ Connection failed: $e\n webUrl : ${widget.wsUrl}\n Token: ${widget.token}');
    }
  }

  void _startSessionTimer() {
    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds--;

        if (_remainingSeconds == 120) {
          _showAlert("Only 2 minutes left!");
        } else if (_remainingSeconds <= 10 && _remainingSeconds > 0) {
          _showCountdown();
        } else if (_remainingSeconds <= 0) {
          _sessionTimer?.cancel();
          widget.onSessionEnd();
          Navigator.of(context).pop();
        }
      });
    });
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Time Warning"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showCountdown() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Call ending in $_remainingSeconds seconds..."),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  void dispose() {
    _sessionTimer?.cancel();
    _room.disconnect();
    super.dispose();
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.mic),
          onPressed: () {
            final enabled = _room.localParticipant?.isMicrophoneEnabled();
            _room.localParticipant?.setMicrophoneEnabled(!enabled!);
          },
        ),
        IconButton(
          icon: const Icon(Icons.videocam),
          onPressed: () {
            final enabled = _room.localParticipant?.isCameraEnabled();
            _room.localParticipant?.setCameraEnabled(!enabled!);
          },
        ),
        IconButton(
          icon: const Icon(Icons.call_end),
          color: Colors.red,
          onPressed: () {
            _sessionTimer?.cancel();
            _room.disconnect();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TeleMed Room')),
      // body: _connected
      //     ? Column(
      //   children: [
      //     // Local Video
      //     SizedBox(
      //       height: 150,
      //       child: _room.localParticipant != null
      //           ? ListView.builder(
      //         scrollDirection: Axis.horizontal,
      //         itemCount: _room.localParticipant?.videoTracks.length ?? 0,
      //         itemBuilder: (context, index) {
      //           final track = _room.localParticipant?.videoTracks.values.elementAt(index);
      //           return VideoTrackRenderer(track as LocalVideoTrack);
      //         },
      //       )
      //           : const Center(child: Text("No camera")),
      //     ),
      //
      //     // Remote Participants
      //     Expanded(
      //       child: _room.remoteParticipants.isEmpty
      //           ? const Center(child: Text("Waiting for others to join..."))
      //           : GridView.builder(
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           childAspectRatio: 16 / 9,
      //         ),
      //         itemCount: _room.remoteParticipants.length,
      //         itemBuilder: (context, index) {
      //           final participant = _room.remoteParticipants.values.elementAt(index);
      //           return _buildRemoteParticipant(participant);
      //         },
      //       ),
      //     ),
      //
      //     // Controls
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: _buildControls(),
      //     ),
      //   ],
      // )
      //     : const Center(child: CircularProgressIndicator()),
    );
  }
}
