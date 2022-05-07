import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';

import '../login_screen.dart';

class ApprovalScreen extends StatelessWidget {
  const ApprovalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('Kayıt İşleminiz Tamamlanmıştır.'),
              CustomButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen() ));
              }, child: Text('Giriş Yap'), color: colorOfMainTheme, width: 100)
            ]
          ),
        ),
      ),
    );
  }
}
