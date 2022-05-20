


import 'package:flutter/material.dart';
import 'package:takasla/features_home/widgets/product_info.dart';


productItem(productName,imageUrl,context){
  return Container(
    child: ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.purpleAccent),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ProductInfoItem()));},
      child: Card(
        shadowColor: Colors.transparent,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(imageUrl,width: 80,),
                SizedBox(height: 10,),
                Text(productName),
              ],
            )),
      ),
    ),
  );
}