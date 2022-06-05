import 'package:flutter/material.dart';
import 'package:takasla/features_user_profile/screens/user_profile_info.dart';
import 'package:takasla/main/constants.dart';

buildMainScreenAppBar(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    leadingWidth: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '',
          style: TextStyle(color: colorOfMainTheme),
        ),
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
