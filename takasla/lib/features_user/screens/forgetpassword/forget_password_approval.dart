import 'package:flutter/material.dart';

import '../../../main/constants.dart';
import '../../../main/ui_components.dart';
import '../login_screen.dart';

class ForgetApprovalScreen extends StatefulWidget {
  const ForgetApprovalScreen({Key? key}) : super(key: key);

  @override
  State<ForgetApprovalScreen> createState() => _ForgetApprovalScreenState();
}

class _ForgetApprovalScreenState extends State<ForgetApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Şifreniz Başarıyla Güncellendi.'),
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
