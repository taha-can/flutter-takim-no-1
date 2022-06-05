

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:takasla/features_home/screens/my_products_select_screen.dart';
import 'package:takasla/main/database_connection/firebase.dart';

import 'package:takasla/main/ui_components.dart';

import '../../main/constants.dart';

class ProductInfoItem extends StatelessWidget {
  dynamic product;
   ProductInfoItem({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var current_user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: colorOfMainTheme,
        toolbarHeight: 30,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            buildTakasUsername(product),
            buildProductPhotos(context,product),
            buildProductName(product),
            buildProductDescription(product),
            buildCategoriesSelected(product),
            buildProductButton(context,current_user),
          ],
        ),
      ),
    );
  }

  Container buildCategoriesSelected(product) {
    return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Kullanıcının öncelikli tercih ettiği kategoriler.',
                style: TextStyle(color: colorOfMainTheme),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: GridView.count(

                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 4,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(product['wanted_category'][0]),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(product['wanted_category'][1]),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(product['wanted_category'][2]),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(product['wanted_category'][3]),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(product['wanted_category'][4]),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(product['wanted_category'][5]),
                    ),

                  ],
                ),
              )
            ],
          ));
  }

  Container buildProductButton(context,current_user) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            padding: EdgeInsets.all(10),
            child: Text(
              '${product['price']} ₺',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: colorOfMainTheme,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2),
                      spreadRadius: 1,
                      blurRadius: 8)
                ]),
          ),
          Container(
              width: 200,
              height: 50,
              child: (current_user.uid.toString() == product['user_id'].toString() || current_user.email == 'theteamflutterno1@gmail.com') ? Container(): CustomButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>MyProductScreen(productForTrade: product,)));
                },
                child: Text(
                  'Takasla',
                  style: TextStyle(fontSize: 30, fontFamily: generalFont),
                ),
                color: colorOfMainTheme,
                width: 300,
              ))
        ],
      ),
    );
  }

  Container buildTakasUsername(produc) => Container(
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
      future: FirabaseService().GetNameByUid(product['user_id'])
      ,builder: (context,AsyncSnapshot snapshot){
        if (snapshot.hasData){
          return Text(
            'Takas İlanı Sahibi: ${snapshot.data!.toString().toUpperCase()}',
            style: TextStyle(color: colorOfMainTheme, fontSize: 20),
          );
        }else {
        return CircularProgressIndicator(color: colorOfMainTheme,);
        }

      })
      
      
      
      ,);
}

SingleChildScrollView buildProductPhotos(BuildContext context,product) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.width / 2,
            child: Image.network(
              product['photoproduct']
             ,
              fit: BoxFit.contain,
            )),


      ],
    ),
  );
}

Container buildProductName(product) => Container(
    padding: EdgeInsets.all(15),
    child: Text(
      product['name'].toString().toUpperCase(),
      style: TextStyle(color: colorOfMainTheme, fontSize: 20),
    ));

Container buildProductDescription(product) =>
    Container(padding: EdgeInsets.all(10), child: Text(product['product_dec']));
