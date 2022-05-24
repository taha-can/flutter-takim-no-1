import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takasla/main/screens/open_app_screen.dart';
import 'package:takasla/main/ui_components.dart';

import '../../main/constants.dart';

class UserProfileInfoScreen extends StatefulWidget {
  const UserProfileInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileInfoScreen> createState() => _UserProfileInfoScreenState();
}

class _UserProfileInfoScreenState extends State<UserProfileInfoScreen> {
  TextEditingController controllerUsernameDisabled = TextEditingController();
  TextEditingController controllerPhoneDisabled = TextEditingController();
  TextEditingController controllerEpostaDisabled = TextEditingController();
  TextEditingController controllerBio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              color: colorOfMainTheme,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.person)
          ),
          Padding(padding: EdgeInsets.all(8),child: CustomButton(onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>OpenAppScreen()));
          }, child: Text('Çıkış Yap'), color: rejectColor, width: 100),)
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                      onPressed: () {},
                      child: Text('Profilimi Düzenle'),
                      color: colorOfMainTheme,
                      width: 200)),
              Container(
                margin: EdgeInsets.all(8),
                child: CustomInputDisabled(
                    color: colorOfMainTheme,
                    controller: controllerUsernameDisabled,
                    labelText: 'Kullanıcı Adı',
                    isPassword: false,
                    maxlength: 1000),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: CustomInputDisabled(
                    color: colorOfMainTheme,
                    controller: controllerPhoneDisabled,
                    labelText: 'Telefon Numarası',
                    isPassword: false,
                    maxlength: 1000),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: CustomInputDisabled(
                    color: colorOfMainTheme,
                    controller: controllerEpostaDisabled,
                    labelText: 'E-Posta',
                    isPassword: false,
                    maxlength: 1000),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: CustomInput(
                    color: colorOfMainTheme,
                    controller: controllerBio,
                    labelText: 'Hakkımda-Bio',
                    isPassword: false,
                    maxlength: 1000),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                        onPressed: () {},
                        child: Text('Şifremi Sıfırla'),
                        color: colorOfMainTheme,
                        width: 200)),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                            onPressed: () {},
                            child: Text('Vazgeç'),
                            color: colorOfSecondThem,
                            width: 200),
                        CustomButton(
                            onPressed: (){},
                            child: Text('Kaydet'),
                            color: approvedColor,
                            width: 200),
                      ],
                    )),
              ),




            ],
          )),
    );
  }
}
