import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';
import 'package:takasla/widgets/main_body_appbar.dart';

class ProdcutInfoArrange extends StatefulWidget {
  const ProdcutInfoArrange({Key? key}) : super(key: key);

  @override
  State<ProdcutInfoArrange> createState() => _ProdcutInfoArrangeState();
}

class _ProdcutInfoArrangeState extends State<ProdcutInfoArrange> {
  TextEditingController controllerProductName = TextEditingController();
  TextEditingController controllerProductDes = TextEditingController();
  TextEditingController controllerProductPrice = TextEditingController();
  bool test = false;
  String dropdownValue = 'Kategori1';

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

          buildPictureUploadField(context),
          buildNewProductName(controllerProductName),
          buildNewProductDescription(controllerProductDes),
          buildNewProductCategory(dropdownValue, context, setState),
          buildProductPrice(controllerProductPrice),
          buildButtons(),
        ],
      ),
    );
  }

}

buildPictureUploadField(context) {
  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/takasla.png',
                width: MediaQuery.of(context).size.width / 0.8,
                height: MediaQuery.of(context).size.height / 6,
              )),
          Container(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/takasla.png',
                width: MediaQuery.of(context).size.width / 0.8,
              ))
        ],
      ));
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
      style: TextStyle(color: colorOfMainTheme),
      decoration: InputDecoration(contentPadding: EdgeInsets.all(20),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colorOfMainTheme)),
          labelStyle: TextStyle(color: colorOfMainTheme),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorOfMainTheme)),
          labelText: 'Ürün Detay Bilgisi',
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colorOfMainTheme))),
      controller: controllerProductDes,
    ),
  );
}

buildNewProductCategory(dropdownValue, context, setState) {
  return Container(
    padding: EdgeInsets.only(bottom:12,top: 12,left: 20,right: MediaQuery.of(context).size.width/2),
    child: DropdownButton<String>(
      value: dropdownValue,
      icon:  Icon(Icons.arrow_downward,color:colorOfMainTheme,size: 18,),
      elevation: 8,
      style:  TextStyle(color: colorOfMainTheme,fontSize: 18),
      underline: Container(
        height: 1,
        color: colorOfMainTheme,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Kategori1', 'Kategori2', 'Kategori3', 'Kategori4']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
}

buildProductPrice(controllerProductPrice) {
  return Container(padding: EdgeInsets.only(left: 20,right: 20),
    child: CustomNumberInput(
        color: colorOfMainTheme,
        controller: controllerProductPrice,
        labelText: 'Tahmini Ürün Değeri',
        isPassword: false,
        maxlength: 20),
  );
}

buildButtons() {
  return Container(
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
        CustomButton(
            onPressed: () {},
            child: Text('Onaya Gönder'),
            color: colorOfMainTheme,
            width: 200),
      ],
    ),
  );
}
