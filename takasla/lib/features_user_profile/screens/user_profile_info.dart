import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:takasla/main.dart';
import 'package:takasla/main/database_connection/firebase.dart';
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
  late String name;
  late String bio;
  late String phone;
  late String email;


  @override
  Widget build(BuildContext context) {
    var current_user = FirebaseAuth.instance.currentUser;
    var current_user_info = FirebaseFirestore.instance
        .collection('users')
        .doc(current_user!.uid)
        .get().then((value) {
          setState((){
            name = value.data()!['name'];
            bio = value.data()!['bio'];
            phone = value.data()!['phone'];
            email = value.data()!['email'];
          });
    });



    return  FutureBuilder(future:buildScaffold(context, current_user),
    builder: (context,snapshot){
      if(snapshot.hasData){
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
                child: Icon(Icons.person)),
            Padding(
              padding: EdgeInsets.all(8),
              child:CustomButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    var cred = await Hive.openBox('localLogin');
                    cred.delete('email');
                    cred.delete('password');
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (builder) => OpenAppScreen()));
                  },
                  child: name == 'misafir' ? Text('Üye Ol'):  Text('Çıkış Yap'),
                  color: name == 'misafir' ? approvedColor : rejectColor,
                  width: 100),
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  child: CustomInputDisabled(
                      color: colorOfMainTheme,
                      controller: controllerUsernameDisabled,
                      labelText: name.isNotEmpty ? name : 'Kullanıcı Adı',
                      isPassword: false,
                      maxlength: 1000),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: CustomInputDisabled(
                      color: colorOfMainTheme,
                      controller: controllerPhoneDisabled,
                      labelText: phone.isNotEmpty ? phone : 'Telefon Numarası',
                      isPassword: false,
                      maxlength: 1000),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: CustomInputDisabled(
                      color: colorOfMainTheme,
                      controller: controllerEpostaDisabled,
                      labelText: email.isNotEmpty ? email: 'Email',
                      isPassword: false,
                      maxlength: 1000),
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.all(8),
                  child: TextField(
                    maxLines: 5,

                    controller: controllerBio,
                    decoration: InputDecoration(
                        hintMaxLines: 3,
                        contentPadding: EdgeInsets.all(20),
                        hintText: bio.isNotEmpty ? bio : 'Hakkımda - Bio',
                        hintStyle: TextStyle(color: colorOfMainTheme),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorOfMainTheme)),
                        border:OutlineInputBorder(borderSide: BorderSide(color: colorOfMainTheme,))


                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Align(
                      alignment: Alignment.center,
                      child: name == 'misafir' ? Container() : CustomButton(
                          onPressed: () {
                            var email = current_user.email;
                            FirabaseService().ResetPassword(email);
                            final snackBar = SnackBar(
                              content: Text(
                                  'Parola Sıfırlama Bağlantısı Mailinize Gönderildi'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
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
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Vazgeç'),
                              color: colorOfSecondThem,
                              width: 200),
                          name == 'misafir' ? Container() : CustomButton(
                              onPressed: () async {
                                var sendName = controllerUsernameDisabled.text.isEmpty ? name : controllerUsernameDisabled.text;
                                var sendEmail = controllerEpostaDisabled.text.isEmpty ? email : controllerEpostaDisabled.text;
                                var sendBio = controllerBio.text.isEmpty ? bio : controllerBio.text;
                                var sendPhone = controllerPhoneDisabled.text.isEmpty ? phone : controllerPhoneDisabled.text;
                                var response = await FirabaseService().UpdateProfile(current_user.uid, sendName, sendEmail, sendPhone, sendBio);
                                if (response){
                                  final snackBar = SnackBar(
                                    content: Text('Bilgileriniz Güncellendi'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              },
                              child: Text('Kaydet'),
                              color: approvedColor,
                              width: 200),
                        ],
                      )),
                ),
              ],
            )),
      );
      }else{
        return Scaffold(
          body: Center(child: CircularProgressIndicator(color: colorOfMainTheme,)),
        );
      };
    }
    );
  }

  Future<Scaffold> buildScaffold(BuildContext context, User current_user) async {
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
            child: Icon(Icons.person)),
        Padding(
          padding: EdgeInsets.all(8),
          child: CustomButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                var cred = await Hive.openBox('localLogin');
                cred.delete('email');
                cred.delete('password');
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (builder) => OpenAppScreen()));
              },
              child: Text('Çıkış Yap'),
              color: rejectColor,
              width: 100),
        )
      ],
    ),
    body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: CustomInputDisabled(
                  color: colorOfMainTheme,
                  controller: controllerUsernameDisabled,
                  labelText: name.isNotEmpty ? name : 'Kullanıcı Adı',
                  isPassword: false,
                  maxlength: 1000),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: CustomInputDisabled(
                  color: colorOfMainTheme,
                  controller: controllerPhoneDisabled,
                  labelText: phone.isNotEmpty ? phone : 'Telefon Numarası',
                  isPassword: false,
                  maxlength: 1000),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: CustomInputDisabled(
                  color: colorOfMainTheme,
                  controller: controllerEpostaDisabled,
                  labelText: email.isNotEmpty ? email : 'Email',
                  isPassword: false,
                  maxlength: 1000),
            ),
            Container(
              height: 100,
              margin: EdgeInsets.all(8),
              child: TextField(

                  controller: controllerBio,
                  decoration: InputDecoration(
                    hintMaxLines: 3,
                    contentPadding: EdgeInsets.all(20),
                      hintText: bio.isNotEmpty ? bio : 'Hakkımda - Bio',
                  hintStyle: TextStyle(color: colorOfMainTheme),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorOfMainTheme)),
                    border:OutlineInputBorder(borderSide: BorderSide(color: colorOfMainTheme,))


                  ),
                 ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                      onPressed: () {
                        var email = current_user.email;
                        FirabaseService().ResetPassword(email);
                        final snackBar = SnackBar(
                          content: Text(
                              'Parola Sıfırlama Bağlantısı Mailinize Gönderildi'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
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
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Vazgeç'),
                          color: colorOfSecondThem,
                          width: 200),
                      CustomButton(
                          onPressed: () async {
                            var sendName = controllerUsernameDisabled.text.isEmpty ? name : controllerUsernameDisabled.text;
                            var sendEmail = controllerEpostaDisabled.text.isEmpty ? email : controllerEpostaDisabled.text;
                            var sendBio = controllerBio.text.isEmpty ? bio : controllerBio.text;
                            var sendPhone = controllerPhoneDisabled.text.isEmpty ? phone : controllerPhoneDisabled.text;
                            var response = await FirabaseService().UpdateProfile(current_user.uid, sendName, sendEmail, sendPhone, sendBio);
                          if (response){
                            final snackBar = SnackBar(
                              content: Text('Bilgileriniz Güncellendi'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          },
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
