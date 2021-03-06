import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';

import '../widgets/notification_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildNotifications(),
      ),
    );
  }

  buildNotifications() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView(
        children: [
          Container(
            child: Center(child: Text('Bildirimler Çok Yakında Sizlerle :)',style: TextStyle(fontSize: 35),)),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width / 1.2,
              child: Card(
                child: Row(
                  children: [

                  ],
                ),
              )),
          
        ],
      ),
    );
  }
}
//  Expanded(
//                         child: TextButton(
//                           onPressed: () {
//                           },
//                           child: Align(
//                               alignment: Alignment.centerLeft,child: Row(
//                                 children: [
//                                   Icon(Icons.add_alert,color: colorOfMainTheme,),
//                                   SizedBox(width: 10,),
//                                   Text('Ürününüz Onaylandı',style: TextStyle(color: colorOfMainTheme),),
//                                 ],
//                               )),
//                           style: ButtonStyle(
//                               fixedSize: MaterialStateProperty.all(Size(100, 100))),
//                         )
//
//                     )