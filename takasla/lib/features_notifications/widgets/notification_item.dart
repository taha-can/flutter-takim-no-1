import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';

class FullSizeNotification extends StatelessWidget {
  String info;
   FullSizeNotification({Key? key,required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           CustomButton(onPressed: (){Navigator.of(context).pop();}, child:Icon(Icons.close) , color: colorOfMainTheme, width: 100),
            Container(margin:EdgeInsets.only(top: MediaQuery.of(context).size.height/3),child: Center(child: Text(info),)),
          ],
        ),
      ),
    );
  }
}
