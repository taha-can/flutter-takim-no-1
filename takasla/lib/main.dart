import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:takasla/features_user/screens/login_screen.dart';
import 'package:takasla/main/screens/main_body_screen.dart';
import 'main/constants.dart';
import 'main/database_connection/firebase.dart';
import 'main/screens/open_app_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final currentuser = Provider((_) => 'a');

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
    return GetMaterialApp(
      home: Scaffold(
        body: FutureBuilder<dynamic>(
            future: checkLocalValues(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data;
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: colorOfMainTheme,
                ));
              }
            }),
      ),
    );
  }

  checkLocalValues() async {
    var cred = await Hive.openBox('localLogin');
    var email = cred.get('email');
    var password = cred.get('password');
    if (email.toString() != 'null' && password.toString() != 'null' ) {
      var logincheck = await FirabaseService().LoginService(email, password);
      if (logincheck) {
        return MainBodyScreen();
      } else {
        return OpenAppScreen();
      }
    } else {
      return OpenAppScreen();
    }
  }
}
