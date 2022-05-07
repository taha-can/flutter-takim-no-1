



import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';

buildMainScreenAppBar(){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    leadingWidth: 0,
    title: Column(
      children: [
        Row(
          children: [
            Text('Merhaba Aylin',style: TextStyle(color: colorOfMainTheme),)
            
          ],
        ),

      ],
    ),
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt_rounded,color: colorOfMainTheme,))
    ],
  );
}