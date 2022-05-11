import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'main/screens/open_app_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: const TakasApp(),
    ),
  );
}

class TakasApp extends StatelessWidget {
  const TakasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OpenAppScreen(),
    );
  }
}
