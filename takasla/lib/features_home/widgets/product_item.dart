


import 'package:flutter/material.dart';
import 'package:takasla/features_home/widgets/product_info.dart';
import 'package:takasla/main/constants.dart';


productItem(product,productName,imageUrl,context){
  return Container(
    child: ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.purpleAccent),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ProductInfoItem(product: product,)));},
      child: Card(
        shadowColor: Colors.transparent,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(imageUrl,width: 150,fit: BoxFit.contain,height: 95,),
                SizedBox(height: 10,),
                Text(productName,style: TextStyle(fontSize: 10,color: colorOfMainTheme),),
              ],
            )),
      ),
    ),
  );
}