



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takasla/features_user_profile/screens/user_profile_info.dart';
import 'package:takasla/main/constants.dart';


buildMainScreenAppBar(context){

  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    leadingWidth: 0,
    title:
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Merhaba Aylin',style: TextStyle(color: colorOfMainTheme),),

          ],
        ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
              IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> UserProfileInfoScreen()));}, icon: Icon(Icons.settings_sharp,color: colorOfMainTheme,))
          ],
        ),
      ),
    ],
  );
}


