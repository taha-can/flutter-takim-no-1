import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takasla/features_user/models.dart';
import 'package:takasla/features_user/screens/signup/signup_email_confirmation.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';

import '../../service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurName = TextEditingController();
  TextEditingController controllerBirthday = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerRePassword = TextEditingController();
  var isLoading = false;
  var check = false;

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerRePassword.dispose();
    controllerEmail.dispose();
    controllerBirthday.dispose();
    controllerSurName.dispose();
    controllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: buildSignUpForm(context),
    ));
  }

  buildSignUpForm(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ListView(
          children: [
            //Logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/takasla.png',
                  width: MediaQuery.of(context).size.width / 1.4,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            buildSignUpNameField(),
            buildSignUpSurnameField(),
            buildSignUpBirthdayField(),
            buildSignUpEmailField(),
            buildSignUpPasswordField(),
            buildSignUpKVKK(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: isLoading
                  ? CircularProgressIndicator(
                      color: colorOfMainTheme,
                    )
                  : CustomButton(
                      onPressed: () async {
                        var _checkData = checkData();

                        if(check){
                          if (_checkData) {
                            bool passCheck = controllerPassword.text ==
                                controllerRePassword.text
                                ? true
                                : false;
                            if (passCheck) {
                              var password = controllerPassword.text;
                              if(passwordCheck(password)){
                                User savedUser = User(
                                    id: '1',
                                    name: controllerName.text.toLowerCase(),
                                    surname: controllerSurName.text.toLowerCase(),
                                    birtday: controllerBirthday.text,
                                    email: controllerEmail.text.toLowerCase(),
                                    password: controllerPassword.text);
                                setState(() {
                                  isLoading = true;
                                });
                                var code = await sendEmailService(
                                    email: savedUser.email.toString(),
                                    user_name: savedUser.name.toString());
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                    builder: (context) => EmailConfirmation(
                                      code: code,
                                      user: savedUser,
                                    )));
                              }else{
                                final snackBar = SnackBar(
                                  content: const Text('Parolan??z en az bir b??y??k harf, bir k??????k harf, bir say?? ve bir ??zel karakter i??ermeli ve en az 8 karakter uzunlu??unda olmal??d??r.'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                              }
                            } else {
                              final snackBar = SnackBar(
                                content: const Text('Parolalar Uyu??muyor'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          } else {
                            final snackBar = SnackBar(
                              content:
                              const Text('L??tfen t??m bilgileri doldurunuz.'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }

                        }else{
                          final snackBar = SnackBar(
                            content:
                            const Text('KVKK metnini l??tfen okuyunuz ve onaylay??n??z.'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                      },
                      child: Text('Kay??t Ol'),
                      color: colorOfMainTheme,
                      width: 100),
            )
          ],
        ),
      ),
    );
  }

  buildSignUpNameField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.4,
              child: CustomInput(
                color: colorOfMainTheme,
                controller: controllerName,
                labelText: 'Ad??n??z',
                isPassword: false,
                maxlength: 100,
              )),
        ),
      ],
    );
  }

  buildSignUpSurnameField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.4,
              child: CustomInput(
                color: colorOfMainTheme,
                controller: controllerSurName,
                labelText: 'Soyad??n??z',
                isPassword: false,
                maxlength: 100,
              )),
        ),
      ],
    );
  }

  buildSignUpBirthdayField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.4,
              child: CustomDateNumberInput(
                color: colorOfMainTheme,
                controller: controllerBirthday,
                labelText: 'Do??um Tarihiniz:  G??n/Ay/Y??l',
                isPassword: false,
                maxlength: 100,
              )),
        ),
      ],
    );
  }

  buildSignUpEmailField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.4,
              child: CustomInput(
                color: colorOfMainTheme,
                controller: controllerEmail,
                labelText: 'E-mail',
                isPassword: false,
                maxlength: 100,
              )),
        ),
      ],
    );
  }

  buildSignUpPasswordField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: CustomInput(
                    color: colorOfMainTheme,
                    controller: controllerPassword,
                    labelText: '??ifreniz',
                    isPassword: true,
                    maxlength: 100,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: CustomInput(
                    color: colorOfMainTheme,
                    controller: controllerRePassword,
                    labelText: '??ifrenizi Tekrar Giriniz',
                    isPassword: true,
                    maxlength: 100,
                  )),
            ),
          ],
        )
      ],
    );
  }

  bool checkData() {
    late bool result;
    bool nameCheck = controllerName.text.isNotEmpty;
    bool surnameCheck = controllerSurName.text.isNotEmpty;
    bool birthdayCheck = controllerBirthday.text.isNotEmpty;
    bool emailCheck = controllerEmail.text.isNotEmpty;
    bool passwordCheck = controllerPassword.text.isNotEmpty;
    bool repasswordCheck = controllerRePassword.text.isNotEmpty;
    if (nameCheck == true &&
        surnameCheck == true &&
        birthdayCheck == true &&
        emailCheck == true &&
        passwordCheck == true &&
        repasswordCheck == true) {
      result = true;
    } else if ((nameCheck &&
            surnameCheck &&
            birthdayCheck &&
            emailCheck &&
            passwordCheck &&
            repasswordCheck) ==
        false) {
      result = false;
    } else {
      result = false;
    }

    return result;
  }

  buildSignUpKVKK() {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: check,
            onChanged: (bool? value) {},
          ),
          TextButton(
              onPressed: () {
                _showMyDialog();
              },
              child: Text('KVKK metnini onayl??yorum.'))
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,

      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('KVKK Metni'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('KVKK metninin i??eri??i'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Onayl??yorum'),
              onPressed: () {
                setState(() {
                  check = true;
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

bool passwordCheck(String password){
  String  reg = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[.?!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(reg);
  return regExp.hasMatch(password);
}