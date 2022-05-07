import 'package:flutter/material.dart';
import 'package:takasla/features_user/screens/forgetpassword/forget_password_screen.dart';

import 'package:takasla/main/constants.dart';

import 'package:takasla/main/screens/main_body_screen.dart';
import 'package:takasla/main/ui_components.dart';

import '../../widgets/appbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  void dispose() {
    controllerPassword.dispose();
    controllerEmail.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildLoginForm(),
    );
  }

  buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildLoginMailField(),
            buildLoginPasswordField(),
            buildForgetPasswordButton(),
            //ForgetPassword
            //LoginButton
            CustomButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MainBodyScreen()));
                },
                child: Text('Giriş'),
                color: colorOfMainTheme,
                width: 100)
          ],
        ),
      ),
    );
  }

  buildLoginMailField() {
    return Row(
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
  buildLoginPasswordField() {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.4,
                child:CustomInput(color: colorOfMainTheme, controller: controllerPassword, labelText: 'Password',isPassword: true,maxlength: 100,)
            ),
          ),
        ],
      );

  }
  buildForgetPasswordButton() {
    return Align(alignment:Alignment.center,child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgetPasswordScreen() ));}, child: Text('Şifremi Unuttum')));
  }
}
