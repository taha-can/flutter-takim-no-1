import 'package:flutter/material.dart';
import 'package:takasla/features_home/widgets/categoryItem.dart';

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
                            image: AssetImage('assets/images/takasla.png')
                          )
                        ),
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Align(alignment:Alignment.bottomCenter,child: Text('Kampanya')),
                  )),
                  Card(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/takasla.png')
                            )
                        ),
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(alignment:Alignment.bottomCenter,child: Text('Kampanya')),
                      )),

                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(8),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: [
                  categoryItem('Ev Yaşam',
                      'https://cdn-icons-png.flaticon.com/512/3163/3163176.png'),
                  categoryItem('Elektronik',
                      'https://cdn-icons-png.flaticon.com/512/3163/3163187.png'),
                  categoryItem('Giyim',
                      'https://cdn-icons-png.flaticon.com/512/3163/3163210.png'),
                  categoryItem('Spor',
                      'https://cdn-icons-png.flaticon.com/512/3163/3163214.png'),
                  categoryItem('Spor',
                      'https://cdn-icons-png.flaticon.com/512/3163/3163214.png'),
                  categoryItem('Spor',
                      'https://cdn-icons-png.flaticon.com/512/3163/3163214.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
