import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoCallScreen extends StatefulWidget {
  final String roomUrl;
  final Function onSessionEnd;

  const VideoCallScreen({super.key, required this.roomUrl, required this.onSessionEnd});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late final WebViewController _controller;
  Timer? _sessionTimer;
  int _remainingTime = 300; // 5 minutes in seconds

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.roomUrl));

    startTimer();
  }

  void startTimer() {
    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime--;

        if (_remainingTime == 120) {
          showAlert("You have 2 minutes left!");
        }

        if (_remainingTime <= 10 && _remainingTime > 0) {
          showCountdown();
        }

        if (_remainingTime <= 0) {
          _sessionTimer?.cancel();
          widget.onSessionEnd();
          Navigator.of(context).pop(); // go back to home
        }
      });
    });
  }

  void showAlert(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Time Alert"),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  void showCountdown() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Ending in $_remainingTime seconds..."),
      duration: const Duration(seconds: 1),
    ));
  }

  @override
  void dispose() {
    _sessionTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
