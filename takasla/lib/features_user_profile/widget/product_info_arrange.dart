import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';
import 'package:takasla/widgets/main_body_appbar.dart';

class ProdcutInfoArrange extends StatefulWidget {
  var product;
   ProdcutInfoArrange( {Key? key,this.product}) : super(key: key);

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

          buildPictureUploadField(context,widget.product),
          buildNewProductName(controllerProductName,widget.product),
          buildNewProductDescription(controllerProductDes,widget.product),
          buildNewProductCategory(context,widget.product),
          buildProductPrice(controllerProductPrice,widget.product),
          buildButtons(widget.product),
        ],
      ),
    );
  }

}

buildPictureUploadField(context,product) {
  return Container(
      child:
          Center(
            child: Container(
                child: Image.network(
                  product['photoproduct'],
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.height / 4,
                )),

      ));
}

buildNewProductName(controllerProductName,product) {
  return Container(
      padding: EdgeInsets.all(20),
      child: CustomInput(
          color: colorOfMainTheme,
          controller: controllerProductName,
          labelText: product['name'],
          isPassword: false,
          maxlength: 20));
}

buildNewProductDescription(controllerProductDes,product) {
  return Container(
    padding: EdgeInsets.all(12),
    child: TextField(
      style: TextStyle(color: colorOfMainTheme),
      decoration: InputDecoration(contentPadding: EdgeInsets.all(20),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colorOfMainTheme)),
          labelStyle: TextStyle(color: colorOfMainTheme),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorOfMainTheme)),
          labelText: product['product_dec'],
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colorOfMainTheme))),
      controller: controllerProductDes,
    ),
  );
}

buildNewProductCategory(context, product) {
  return Container(padding: EdgeInsets.only(left: 20,right: 20),
    child: Text("Ürün Kategorisi : ${product['category_id']}",style: TextStyle(color: colorOfMainTheme,fontSize: 25),)
  );
}

buildProductPrice(controllerProductPrice,product) {
  return Container(padding: EdgeInsets.only(left: 20,right: 20),
    child: CustomNumberInput(
        color: colorOfMainTheme,
        controller: controllerProductPrice,
        labelText: product['price'],
        isPassword: false,
        maxlength: 20),
  );
}

buildButtons(product) {
  return Container(
    padding: EdgeInsets.all(14.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
                onPressed: () {
                },
                child: Text('Değişiklikleri Kaydet'),
                color: approvedColor,
                width: 200),
            CustomButton(
                onPressed: () {},
                child: Text('Ürünü Sil'),
                color: rejectColor,
                width: 200),

          ],
        ),
        CustomButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Vazgeç'),
            color: colorOfSecondThem,
            width: 200),

      ],
    ),
  );
}
