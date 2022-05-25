import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';

import '../../main/ui_components.dart';
import 'dart:io';
import 'dart:convert';

import 'package:intl/intl.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({Key? key}) : super(key: key);

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  String dropdownValue = 'Ankara Teslimat Merkezi';
  DateTime? _dateTime;
  dynamic dodString = "";
  late String dodToSend;
  Map<String, Image> ListOfDelivered = {
    'Ankara Teslimat Merkezi': Image.asset('assets/images/ankara.png'),
    'İstanbul Teslimat Noktası1':  Image.asset('assets/images/istanbul1.png'),
    'İstanbul Teslimat Noktası2':  Image.asset('assets/images/istanbul2.png'),
    'İstanbul Teslimat Noktası3':  Image.asset('assets/images/istanbul3.png'),
  };
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
                Expanded(
                    child: ListView(
                  children: [
                    GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(8),
                      childAspectRatio: 0.60,
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      children: [
                        CustomCard(
                            onPressed: () {
                              print('Ürün');
                            },
                            text: 'Ürün',
                            imageUrl:
                                'https://images.pexels.com/photos/3731256/pexels-photo-3731256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                        CustomCard(
                            onPressed: () {
                              print('Ürün');
                            },
                            text: 'Ürün',
                            imageUrl:
                                'https://images.pexels.com/photos/3731256/pexels-photo-3731256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                        CustomCard(
                            onPressed: () {
                              print('Ürün');
                            },
                            text: 'Ürün',
                            imageUrl:
                                'https://images.pexels.com/photos/3731256/pexels-photo-3731256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                        CustomCard(
                            onPressed: () {
                              print('Ürün');
                            },
                            text: 'Ürün',
                            imageUrl:
                                'https://images.pexels.com/photos/3731256/pexels-photo-3731256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                        CustomCard(
                            onPressed: () {
                              print('Ürün');
                            },
                            text: 'Ürün',
                            imageUrl:
                                'https://images.pexels.com/photos/3731256/pexels-photo-3731256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                        CustomCard(
                            onPressed: () {
                              print('Ürün');
                            },
                            text: 'Ürün',
                            imageUrl:
                                'https://images.pexels.com/photos/3731256/pexels-photo-3731256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                        CustomCard(
                            onPressed: () {
                              print('Ürün');
                            },
                            text: 'Ürün',
                            imageUrl:
                                'https://images.pexels.com/photos/3731256/pexels-photo-3731256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                        CustomCard(
                            onPressed: () {
                              print('Ürün');
                            },
                            text: 'Ürün',
                            imageUrl:
                                'https://images.pexels.com/photos/3731256/pexels-photo-3731256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                      ],
                    )
                  ],
                )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: colorOfMainTheme,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          'Ankara Teslimat Merkezi',
                          'İstanbul Teslimat Noktası1',
                          'İstanbul Teslimat Noktası2',
                          'İstanbul Teslimat Noktası3'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Container(
                        child: ListOfDelivered[dropdownValue],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 2.6,
                              alignment: Alignment.bottomCenter,
                              height: 40,
                              child: TextField(
                                style: TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: colorOfMainTheme)),
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: colorOfMainTheme)),
                                  icon: Icon(
                                    Icons.calendar_today,
                                    color: colorOfMainTheme,
                                  ), //icon of text field
                                  hintText: dodString == ""
                                      ? "Teslimat Tarihi"
                                      : dodString.toString().substring(0, 10),
                                ),
                                readOnly:
                                    true, //set it true, so that user will not able to edit text
                                onTap: () async {
                                  showDatePicker(
                                          context: context,
                                          builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(
                                                colorScheme: ColorScheme.light(
                                                    primary: colorOfMainTheme,
                                                    onPrimary: Colors
                                                        .white, // header text color
                                                    onSurface:
                                                        colorOfMainTheme),
                                                textButtonTheme:
                                                    TextButtonThemeData(
                                                  style: TextButton.styleFrom(
                                                      primary: colorOfMainTheme
                                                      // button text color
                                                      ),
                                                ),
                                              ),
                                              child: child!,
                                            );
                                          },
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2275))
                                      .then((value) {
                                    setState(() {
                                      _dateTime = value;
                                      dodString = DateFormat('dd/MM/yyyy')
                                          .format(_dateTime!);
                                      dodToSend =
                                          DateFormat('dd/MM/yyyy HH/mm/ss')
                                              .format(_dateTime!);
                                    });
                                  });
                                },
                              )),
                          CustomButton(
                              onPressed: () {},
                              child: Text('Teklif Ver'),
                              color: colorOfMainTheme,
                              width: 100)
                        ],
                      )
                    ],
                  ),
                )
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
