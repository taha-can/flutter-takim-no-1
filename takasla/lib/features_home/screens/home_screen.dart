import 'package:flutter/material.dart';
import 'package:takasla/features_home/widgets/product_item.dart';
import 'package:takasla/main/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                      child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/takasla.png'))),
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text('Kampanya')),
                  )),
                  Card(
                      child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/takasla.png'))),
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text('Kampanya')),
                  )),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Card(
                        child: Container(
                          alignment: Alignment.center,
                            width: 100,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Ev&Yaşam',
                              style: TextStyle(color: colorOfMainTheme),
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Card(
                        child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Kıyafet',
                              style: TextStyle(color: colorOfMainTheme),
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Card(
                        child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Eğitim',
                              style: TextStyle(color: colorOfMainTheme),
                            )),
                      ),
                    ),


                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Card(

                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Spor',
                                style: TextStyle(color: colorOfMainTheme),
                              )),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Card(
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Elektronik',
                                style: TextStyle(color: colorOfMainTheme),
                              )),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Card(
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text(
                                    'Biletler',
                                    style: TextStyle(color: colorOfMainTheme),
                                  ),
                                  Text(
                                    'Kuponlar',
                                    style: TextStyle(color: colorOfMainTheme),
                                  ),
                                ],
                              )),
                        ),
                      ),


                    ],),


                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(8),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: MediaQuery.of(context).size.width>500 ? 8 : 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: [
                  productItem('Ürün',
                      'https://cdn-icons-png.flaticon.com/512/3163/3163176.png',context),
                  productItem('Ürün',
                      'https://cdn-icons-png.flaticon.com/512/3163/3163176.png',context),
                  productItem('Ürün',
                      'https://cdn-icons-png.flaticon.com/512/3163/3163214.png',context),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
