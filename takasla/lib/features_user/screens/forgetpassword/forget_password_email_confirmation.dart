import 'package:flutter/material.dart';

import '../../../main/constants.dart';
import '../../../main/ui_components.dart';
import 'forget_password_approval.dart';

class ForgetEmailConfirmscreen extends StatefulWidget {
  const ForgetEmailConfirmscreen({Key? key}) : super(key: key);

  @override
  State<ForgetEmailConfirmscreen> createState() => _ForgetEmailConfirmscreenState();
}

class _ForgetEmailConfirmscreenState extends State<ForgetEmailConfirmscreen> {
  TextEditingController controllerEmailCode = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerRePassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildConfirm(context),
    );
  }

  buildConfirm(context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Mail Adresinize Gelen 6 Haneli Kodu Giriniz')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.4,
                      child:CustomInput(color: colorOfMainTheme, controller: controllerEmailCode, labelText: '',isPassword: false, maxlength:6)
                  ),
                ),

              ],
            ),
            buildSignUpPasswordField(),
            CustomButton(onPressed: (){
              var serviceEmailCode = 111111;
              var checkMailCode = controllerEmailCode.text;
              if (checkMailCode.toString() == serviceEmailCode.toString()){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ForgetApprovalScreen() ));
              }
              else{
                print('Kod Hatalı');
              }



            }, child: Text('Devam'), color: colorOfMainTheme, width: 100)
          ],
        ),
      ),
    );
  }
  buildSignUpPasswordField() {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.4,
                    child:CustomInput(color: colorOfMainTheme, controller: controllerPassword, labelText: 'Şifreniz',isPassword: true,maxlength: 100,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.4,
                    child:CustomInput(color: colorOfMainTheme, controller: controllerRePassword, labelText: 'Şifrenizi Tekrar Giriniz',isPassword: true,maxlength: 100,)
                ),
              ),
            ],
          )
        ],
      );

  }
}

