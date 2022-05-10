


import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';

categoryItem(categoryName,imageUrl){
  return Container(
    child: ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.purpleAccent),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: (){print(categoryName);},
      child: Card(
        shadowColor: Colors.transparent,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(imageUrl,width: 80,),
                SizedBox(height: 10,),
                Text(categoryName),
              ],
            )),
      ),
    ),
  );
}