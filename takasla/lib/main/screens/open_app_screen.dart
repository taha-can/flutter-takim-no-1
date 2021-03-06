import 'package:flutter/material.dart';
import 'package:takasla/features_user/screens/login_screen.dart';
import 'package:takasla/features_user/screens/signup/signup_screen.dart';
import 'package:takasla/main/database_connection/firebase.dart';
import 'package:takasla/main/ui_components.dart';

import '../../widgets/appbar.dart';
import '../constants.dart';
import 'main_body_screen.dart';


class OpenAppScreen extends StatelessWidget {
  const OpenAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: CustomButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen() ));
                                      },
                                      child: Text('Giriş Yap'),
                                      color: colorOfMainTheme,
                                      width: 200)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: CustomButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignUpScreen() ));

                                      },
                                      child: Text('Kayıt Ol'),
                                      color: colorOfMainTheme,
                                      width: 100)),
                            ),

                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              child: Text('Misafir Olarak Devam Et'),
              onPressed: () async {
                var response = await FirabaseService().LoginService('theteamflutterno1@gmail.com', '12345tG.?').then((value)=>value.toString());
                if (response == 'true') {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>  MainBodyScreen()));
                }
              },
            ),
          ),
        ),
      )
    );
  }
}
