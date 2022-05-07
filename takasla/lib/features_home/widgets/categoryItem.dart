


import 'package:flutter/material.dart';

categoryItem(){
  return Container(
    child: Card(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/takasla.png',width: 100,),
              SizedBox(height: 10,),
              Text('Kategori'),
            ],
          )),
    ),
  );
}