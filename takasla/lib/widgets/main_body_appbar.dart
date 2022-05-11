



import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';

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
            Text('Merhaba Aylin',style: TextStyle(color: colorOfMainTheme),),
          ],
        ),

      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Icon(Icons.star_border,color: colorOfMainTheme,),
            Icon(Icons.star_border,color: colorOfMainTheme,),
            Icon(Icons.star_border,color: colorOfMainTheme,),
            Icon(Icons.star_border,color: colorOfMainTheme,),
            Icon(Icons.star_border,color: colorOfMainTheme,),
          ],
        ),
      ),
    ],
  );
}