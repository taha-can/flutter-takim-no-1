import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/database_connection/firebase.dart';
import 'package:takasla/main/screens/main_body_screen.dart';
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
          buildButtons(context,widget.product,controllerProductName,controllerProductPrice,controllerProductDes),
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
          maxlength: 10));
}

buildNewProductDescription(controllerProductDes,product) {
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

buildButtons(context,product,controllerProductName,controllerProductPrice,controllerProductDes) {
  return Container(
    padding: EdgeInsets.all(14.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
                onPressed: () async {
                  var price = controllerProductPrice.text.toString().isEmpty ? product['price'] : controllerProductPrice.text;
                  var name = controllerProductName.text.toString().isEmpty ? product['name'] : controllerProductName.text;
                  var des = controllerProductDes.text.toString().isEmpty ? product['product_dec'] : controllerProductDes.text;

                  var response = await FirabaseService().UpdateProduct(product['product_id'], product['category_id'], name, price, des, product['wanted_category'], product['photoproduct']).then((value)=>value.toString());
                  if (response=='true'){
                    final snackBar = SnackBar(
                      content: Text('Değişiklikler Kaydedildi'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else{
                    final snackBar = SnackBar(
                      content: Text('Bir Hata Oluştu'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  }
                },
                child: Text('Değişiklikleri Kaydet'),
                color: approvedColor,
                width: 200),
            CustomButton(
                onPressed: () async {
                  var response = await FirabaseService().DeleteProduct(product['product_id']).then((value)=>value.toString());
                  if(response =='true'){
                    var res =  'Ürününüz Başarıyla Silinmiştir';
                    _showMyDialog(context,res);
                  }
                  else{
                    var res =  'Ürünününüzün Silinmesinde Bir Hata Oluştu';
                    _showMyDialog(context,res);

                  }
                },
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

Future<void> _showMyDialog(context,res) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Ürün Silme İşlemi'),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Text(res),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MainBodyScreen()));
            },
          ),
        ],
      );
    },
  );
}
