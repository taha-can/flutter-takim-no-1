
import 'package:flutter/material.dart';
import '../../main/constants.dart';

buildAppBar(){
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text('Takasla',style: TextStyle(
      color: colorOfMainTheme,
      fontSize: 30,
      fontFamily: 'Poppins',
    ),),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}