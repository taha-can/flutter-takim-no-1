import 'package:flutter/material.dart';
import 'package:takasla/main/database_connection/firebase.dart';

import '../../../main/constants.dart';
import '../../../main/ui_components.dart';
import 'forget_password_approval.dart';

class ForgetEmailConfirmscreen extends StatefulWidget {
  String securecode;
  String email;
   ForgetEmailConfirmscreen({Key? key,required this.securecode,required this.email}) : super(key: key);

  @override
  State<ForgetEmailConfirmscreen> createState() => _ForgetEmailConfirmscreenState();
}

class _ForgetEmailConfirmscreenState extends State<ForgetEmailConfirmscreen> {
  TextEditingController controllerEmailCode = TextEditingController();



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
            CustomButton(onPressed: () async {
              var serviceEmailCode = widget.securecode;
              var checkMailCode = controllerEmailCode.text;
              if (checkMailCode.toString() == serviceEmailCode.toString()){
                  var response = await FirabaseService().ResetPassword(widget.email);
                  if(response){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ForgetApprovalScreen() ));
                  }else{
                    final snackBar = SnackBar(
                      content: Text('Bir daha oluştu lütfen daha sonra tekrar deneyiniz'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
              }
              else{
                final snackBar = SnackBar(
                  content: Text('Kod Hatalı'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }



            }, child: Text('Devam'), color: colorOfMainTheme, width: 100)
          ],
        ),
      ),
    );
  }

}

