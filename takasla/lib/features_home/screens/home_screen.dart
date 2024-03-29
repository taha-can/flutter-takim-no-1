// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:takasla/features_home/widgets/product_item.dart';
import 'package:takasla/main/constants.dart';
import '../../main/database_connection/firebase.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var current_user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
        SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Card(
                child: Container(
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/kampanya1.png'))),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container()),
                )),
            Card(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/kampanya2.png'))),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container()),
                )),
          ],
        ),
      ),
          Expanded(
            child: FutureBuilder(
              future: FirabaseService().GetProductsAll(),
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return current_user!.email == 'theteamflutterno1@gmail.com' ? Center(child: Text('Ürünler Sayfasını Görebilmek İçin Lütfen Üye Olunuz'),):GridView.count(


                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(8),
                    crossAxisCount: MediaQuery.of(context).size.width>500 ? 8 : 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.8,
                    children: List.generate(
                        snapshot.data!.length,
                            (index) => productItem(snapshot.data![index],
                            snapshot.data![index]['name'].toString().toUpperCase(),
                            snapshot.data![index]['photoproduct'],context )),
                  );
                } else {
                  return Center(child: CircularProgressIndicator(color: colorOfMainTheme,));
                }
              },
            ),
          ),


        ],
      ),
    ));
  }
}



// Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(3),
//                       child:Container(
//                           alignment: Alignment.center,
//                             padding: EdgeInsets.all(8),
//                             child: ElevatedButton(
//                               onPressed: (){},
//                               child: Text('Ev&Yaşam',style: TextStyle(color: Colors.white),),
//                               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colorOfMainTheme),maximumSize: MaterialStateProperty.all(Size(150, 400))),
//                             )),
//
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(3),
//                       child:Container(
//                           alignment: Alignment.center,
//                           padding: EdgeInsets.all(8),
//                           child: ElevatedButton(
//                             onPressed: (){},
//                             child: Text('Kıyafet',style: TextStyle(color: Colors.white),),
//                             style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colorOfMainTheme),maximumSize: MaterialStateProperty.all(Size(150, 400))),
//                           )),
//
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(3),
//                       child:Container(
//                           alignment: Alignment.center,
//                           padding: EdgeInsets.all(8),
//                           child: ElevatedButton(
//                             onPressed: (){},
//                             child: Text('Eğitim',style: TextStyle(color: Colors.white),),
//                             style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colorOfMainTheme),maximumSize: MaterialStateProperty.all(Size(150, 400))),
//                           )),
//
//                     ),
//                   ],),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(3),
//                         child:Container(
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.all(8),
//                             child: ElevatedButton(
//                               onPressed: (){},
//                               child: Text('Spor',style: TextStyle(color: Colors.white),),
//                               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colorOfMainTheme),maximumSize: MaterialStateProperty.all(Size(150, 400))),
//                             )),
//
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(3),
//                         child:Container(
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.all(8),
//                             child: ElevatedButton(
//                               onPressed: (){},
//                               child: Text('Elektronik',style: TextStyle(color: Colors.white),),
//                               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colorOfMainTheme),maximumSize: MaterialStateProperty.all(Size(150, 400))),
//                             )),
//
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(3),
//                         child:Container(
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.all(8),
//                             child: ElevatedButton(
//                               onPressed: (){},
//                               child: Text('Biletler&Kuponlar',style: TextStyle(color: Colors.white),),
//                               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colorOfMainTheme),maximumSize: MaterialStateProperty.all(Size(95, 400))),
//                             )),
//
//                       ),
//
//
//                     ],),