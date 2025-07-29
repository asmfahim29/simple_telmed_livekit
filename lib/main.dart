import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'package:telemed/AGORA/pages/index.dart';

void main() async {
  // final format = DateFormat('HH:mm:ss');
  // // configure logs for debugging
  // Logger.root.level = Level.FINE;
  // Logger.root.onRecord.listen((record) {
  //   print('${format.format(record.time)}: ${record.message}');
  // });

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IndexPage(),
    );
  }
}
