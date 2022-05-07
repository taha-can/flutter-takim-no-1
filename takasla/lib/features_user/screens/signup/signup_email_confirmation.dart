import 'package:flutter/material.dart';
import 'package:takasla/features_user/screens/signup/signup_approval.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';

import '../../models.dart';

class EmailConfirmation extends StatefulWidget {
  String code;
  User user;
   EmailConfirmation({Key? key,required this.code,required this.user}) : super(key: key);

  @override
  State<EmailConfirmation> createState() => _EmailConfirmationState();
}

class _EmailConfirmationState extends State<EmailConfirmation> {
  TextEditingController controller1 = TextEditingController();
  void dispose() {
    controller1.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildConfirm(context),
    );
  }

  buildConfirm(context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
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
                      child:CustomNumberInput(color: colorOfMainTheme, controller: controller1, labelText: '',isPassword: false, maxlength:6)
                  ),
                ),

              ],
            ),
            CustomButton(onPressed: (){
              var serviceEmailCode = widget.code;
              var checkMailCode = controller1.text;
              if (checkMailCode.toString() == serviceEmailCode.toString()){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ApprovalScreen() ));
              }
              else{
                final snackBar = SnackBar(
                  content: const Text('Kod Hatalı'),
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
