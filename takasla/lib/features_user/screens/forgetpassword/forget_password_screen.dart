import 'package:flutter/material.dart';
import 'package:takasla/features_user/screens/forgetpassword/forget_password_email_confirmation.dart';
import 'package:takasla/features_user/service.dart';

import '../../../main/constants.dart';
import '../../../main/ui_components.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildForgetPasswordForm(),
    );
  }

  buildForgetPasswordForm() {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,children: [
              Container(child: Image.asset('assets/images/takasla.png'),width: MediaQuery.of(context).size.width/1.4,)
            ],),
            buildForgetPasswordEmailField(),
            CustomButton(
                onPressed: () async {
                  var securecode = await sendEmailPasswordresetService(email: controllerEmail.text);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ForgetEmailConfirmscreen( securecode: securecode,email: controllerEmail.text,) ));
                },
                child: Container(child: Text('Şifremi Yenile',)),
                color: colorOfMainTheme,
                width: 150)
          ],
        ),
      ),
    );
  }

  buildForgetPasswordEmailField() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.4,
              child:CustomInput(color: colorOfMainTheme, controller: controllerEmail, labelText: 'E-mail',isPassword: false,maxlength: 100,)
          ),
        ),
      ],
    );
  }
}
