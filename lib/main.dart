import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemed/test/test_screen.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'package:telemed/home/home%20screen.dart';
import 'package:telemed/theme.dart';
import 'pages/connect.dart';
import 'service_class/custom_http_override.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = CustomHttpOverride();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
