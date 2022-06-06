import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/database_connection/firebase.dart';
import 'package:takasla/main/screens/main_body_screen.dart';
import 'package:takasla/main/ui_components.dart';
import 'package:takasla/widgets/main_body_appbar.dart';
import 'package:uuid/uuid.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  TextEditingController controllerProductName = TextEditingController();
  TextEditingController controllerProductDes = TextEditingController();
  TextEditingController controllerProductPrice = TextEditingController();
  bool test = false;
  String dropdownValue = 'Ev&Yaşam';
  String confirm_text = 'Onaya Gönder';
  bool disabledbutton = false;
  File? pickedFile;
  UploadTask? uploadedTask;

  Future SelectFile() async {
    try{
      final result = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (result == null) return;
      final temporary = File(result.path);
      setState(() {
        pickedFile = temporary;
      });

    }on PlatformException catch(e){
      print('Failed to Upload');
    }
  }

  Future TakePhoto() async {
    try{
      final result = await ImagePicker().pickImage(source: ImageSource.camera);
      if (result == null) return;
      final temporary = File(result.path);
      setState(() {
        pickedFile = temporary;
      });

    }on PlatformException catch(e){
      print('Failed to Upload');
    }
  }

  Future _UploadFile(str) async{
    var work = str;
    try{
      final file = File(pickedFile!.path);
      final filename = controllerProductName.text.toString();
      final path = 'product_photo/$filename';
      final ref = FirebaseStorage.instance.ref(path);
      uploadedTask = ref.putFile(file);
      final snapshot = await uploadedTask!.whenComplete((){});
      final urlDownload = await snapshot.ref.getDownloadURL();
      return urlDownload;

    } catch(e){
      print(e);
    }


  }

  void dispose() {
    controllerProductDes.dispose();
    controllerProductPrice.dispose();
    controllerProductName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildMainScreenAppBar(context),
        body: Center(child: buildTradeScreen(context)));
  }

  buildTradeScreen(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: [
          buildWelcomeMessage(),
        Column(
          children: [
            Row(
              children: [
                if(pickedFile != null)
                  Container(
                      padding: EdgeInsets.all(8),
                      child:  Image.file(
                        File(pickedFile!.path),
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 3.5,
                        fit: BoxFit.contain,
                      )),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                    color: colorOfMainTheme,
                    onPressed: SelectFile,
                    width: 200,
                    child: Text('Fotoğraf Seç')),
                CustomButton(
                    color: colorOfMainTheme,
                    onPressed: TakePhoto,
                    width: 200,
                    child: Text('Kamera'))
              ],
            ),
          ],
        ),

          buildNewProductName(controllerProductName),
          buildNewProductDescription(controllerProductDes),
          Container(
            padding: EdgeInsets.only(
                bottom: 12,
                top: 12,
                left: 20,
                right: MediaQuery.of(context).size.width / 2.2),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(
                Icons.arrow_downward,
                color: colorOfMainTheme,
                size: 18,
              ),
              elevation: 8,
              style: TextStyle(color: colorOfMainTheme, fontSize: 18),
              underline: Container(
                height: 1,
                color: colorOfMainTheme,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'Ev&Yaşam',
                'Kıyafet',
                'Eğitim',
                'Spor',
                'Elektronik',
                'Biletler&Kuponlar'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          buildProductPrice(controllerProductPrice),
          Container(
            padding: EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Vazgeç'),
                    color: colorOfSecondThem,
                    width: 100),
                Container(
                  child: CustomButton(
                      onPressed: disabledbutton
                          ? null
                          : () async {
                              if (controllerProductName.text.isNotEmpty &&
                                  controllerProductDes.text.isNotEmpty &&
                                  controllerProductPrice.text.isNotEmpty) {
                                setState(() {
                                  confirm_text = 'Ürününüz onay bekliyor';
                                  disabledbutton = true;
                                });
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                var photoproduct = await _UploadFile('work');
                                var uuid = Uuid();
                                var product_id = uuid.v1();
                                var response = await FirabaseService()
                                    .AddProduct(
                                    product_id,
                                        dropdownValue,
                                        controllerProductName.text,
                                        controllerProductPrice.text,
                                        controllerProductDes.text, [
                                  'Ev&Yaşam',
                                  'Kıyafet',
                                  'Eğitim',
                                  'Spor',
                                  'Elektronik',
                                  'Biletler&Kuponlar'
                                ],photoproduct).then((value) => value.toString());
                                if (response == 'true') {

                                  await Future.delayed(
                                      const Duration(seconds: 3));
                                  setState(() {
                                    confirm_text = 'Ürününüz onaylandı ';
                                  });

                                  await Future.delayed(
                                      const Duration(seconds: 4));

                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainBodyScreen()));

                                } else {
                                  final snackBar = SnackBar(
                                    content: Text('Bir Hata Oluştu'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  setState(() {
                                    confirm_text = 'Onaya Gönder ';
                                    disabledbutton = false;
                                  });
                                }
                              } else {
                                final snackBar = SnackBar(
                                  content:
                                      Text('Lütfen Tüm alanları doldurunuz'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                      child: Text(confirm_text),
                      color: colorOfMainTheme,
                      width: 200),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildWelcomeMessage() {
    return Container(
        padding: EdgeInsets.all(8),
        child: Text(
          'Takaslamaya başlamak için haydi birkaç ürün ekleyelim. :)',
          style: TextStyle(color: Colors.black, fontSize: 13.5),
        ));
  }
}



buildNewProductName(controllerProductName) {
  return Container(
      padding: EdgeInsets.all(20),
      child: CustomInput(
          color: colorOfMainTheme,
          controller: controllerProductName,
          labelText: 'Ürün Adı Giriniz',
          isPassword: false,
          maxlength: 20));
}

buildNewProductDescription(controllerProductDes) {
  return Container(
    padding: EdgeInsets.all(12),
    child: TextField(
      maxLines: 5,
      style: TextStyle(color: colorOfMainTheme),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorOfMainTheme)),
          labelStyle: TextStyle(color: colorOfMainTheme),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorOfMainTheme)),
          labelText: 'Ürün Detay Bilgisi',
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colorOfMainTheme))),
      controller: controllerProductDes,
    ),
  );
}

buildProductPrice(controllerProductPrice) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: CustomNumberInput(
        color: colorOfMainTheme,
        controller: controllerProductPrice,
        labelText: 'Tahmini Ürün Değeri',
        isPassword: false,
        maxlength: 20),
  );
}
