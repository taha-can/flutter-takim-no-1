import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';
import 'package:uuid/uuid.dart';
import '../../features_trade/screens/trade_deliver_screen.dart';
import '../../main/database_connection/firebase.dart';
import '../../main/ui_components.dart';


import 'package:intl/intl.dart';

class MyProductScreen extends StatefulWidget {
  dynamic productForTrade;
   MyProductScreen({Key? key, required this.productForTrade}) : super(key: key);

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  String dropdownValue = 'Ankara Teslimat Merkezi';
  DateTime? _dateTime;
  dynamic dodString = "";
  late String dodToSend;
  var selectedProductToTrade;
  var bgColorSelected;
  Map<String, Image> ListOfDelivered = {
    'Ankara Teslimat Merkezi': Image.asset('assets/images/ankara.png'),
    'İstanbul Teslimat Noktası1':  Image.asset('assets/images/istanbul1.png'),
    'İstanbul Teslimat Noktası2':  Image.asset('assets/images/istanbul2.png'),
    'İstanbul Teslimat Noktası3':  Image.asset('assets/images/istanbul3.png'),
  };
  @override
  Widget build(BuildContext context) {
    var current_user = FirebaseAuth.instance.currentUser;
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
                          child: FutureBuilder(
                              future: FirabaseService().GetNameByUid(current_user!.uid)
                              ,builder: (context,AsyncSnapshot snapshot){
                            if (snapshot.hasData){
                              return Text(
                                'Takas Kullanıcısı ${snapshot.data!.toString().toUpperCase()}',
                                style: TextStyle(color: colorOfMainTheme, fontSize: 20),
                              );
                            }else {
                              return CircularProgressIndicator(color: colorOfMainTheme,);
                            }

                          })



                        )
                      ],
                    )
                  ],
                ),
                Expanded(
                    child: ListView(
                  children: [
                    FutureBuilder(
                      future: FirabaseService().GetProductsByUid(),
                      builder: (context, AsyncSnapshot<List> snapshot) {
                        if (snapshot.hasData) {
                          return current_user.email == 'theteamflutterno1@gmail.com' ? Center(child: Text('Benim Ürünlerim'),):GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(8),
                            childAspectRatio: 0.8,
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            children: List.generate(
                                snapshot.data!.length,
                                    (index) => CustomCard(
                                      bgcolor: (index == bgColorSelected) ? 'var' : null,
                                    onPressed: () {
                                          setState((){
                                            selectedProductToTrade = snapshot.data![index];
                                            bgColorSelected =  index;
                                          });
                                    },
                                    text: snapshot.data![index]['name'].toString().toUpperCase(),
                                    imageUrl: snapshot.data![index]['photoproduct'] )),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator(color: colorOfMainTheme,));
                        }
                      },
                    ),
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
                              onPressed: ()  async {
                                if(dropdownValue.toString().isNotEmpty && dodString.toString().isNotEmpty && selectedProductToTrade.toString().isNotEmpty ){
                                  final snackBar = SnackBar(
                                    content: Text('Bir Hata Oluştu'),
                                  );
                                  var usernameForTrade = await FirabaseService().GetNameByUid(widget.productForTrade['user_id']).then((value)=>value.toString());
                                  var usernameToTrade = await FirabaseService().GetNameByUid(selectedProductToTrade['user_id']).then((value)=>value.toString());
                                  var uuid = Uuid();
                                  var offerid = uuid.v1();
                                  var response = await FirabaseService().TradeAdd(widget.productForTrade['user_id'],selectedProductToTrade['user_id'],offerid, widget.productForTrade['name'],selectedProductToTrade['name'], dropdownValue, dodString, usernameForTrade.toString(),usernameToTrade.toString(), false, true,  widget.productForTrade['price'],selectedProductToTrade['price'],widget.productForTrade['photoproduct'],selectedProductToTrade['photoproduct']).then((value)=>value.toString());
                                  response == 'true' ? Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> TradeDelivery(productChange: selectedProductToTrade,productForTrade: widget.productForTrade,dodToSend:dodString,deliverycenter:dropdownValue)))
                                      :ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }else{
                                  _showMyDialog();
                                }
                              },
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



  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hata'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Lütfen Tüm Alanları Seçiniz'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Kapat'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }




}

