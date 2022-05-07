import 'package:flutter/material.dart';
import 'main/open_app_screen.dart';


void main() {
  runApp(const TakasApp());
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
