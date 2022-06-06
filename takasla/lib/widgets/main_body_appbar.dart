import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:takasla/features_user_profile/screens/user_profile_info.dart';
import 'package:takasla/main/constants.dart';

import '../main/database_connection/firebase.dart';

buildMainScreenAppBar(context) {
  var current_user = FirebaseAuth.instance.currentUser;
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    leadingWidth: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FutureBuilder(
            future: FirabaseService().GetNameByUid(current_user!.uid)
            ,builder: (context,AsyncSnapshot snapshot){
          if (snapshot.hasData){
            return Text(
              'Merhaba ${snapshot.data!.toString().toUpperCase()}',
              style: TextStyle(color: colorOfMainTheme, fontSize: 20),
            );
          }else {
            return CircularProgressIndicator(color: colorOfMainTheme,);
          }

        })
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            TextButton(
              child: Row(
                children: [
                  Text(
                    'Profilim',
                    style: TextStyle(color: colorOfMainTheme,fontSize: 15),
                  ),
SizedBox(width: 10,),
                 Icon(
                        Icons.settings_sharp,
                        color: colorOfMainTheme,
                      )
                ],
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (builder) => UserProfileInfoScreen()));
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(colorOfMainTheme),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
            ),

          ],
        ),
      ),
    ],
  );
}
