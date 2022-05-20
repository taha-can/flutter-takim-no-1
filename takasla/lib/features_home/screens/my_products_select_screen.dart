import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';

import '../../main/ui_components.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({Key? key}) : super(key: key);

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.person,
                              size: 50,
                            )),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Kullanıcı Adı',
                            style: TextStyle(
                                color: colorOfMainTheme, fontSize: 20),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                   ListView(
                          children:[
                          Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                            Container(child: Text('asasa')),
                        ],
                      ),
                  ],

            ),
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: colorOfMainTheme,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close)),
      ),
    );
  }
}
