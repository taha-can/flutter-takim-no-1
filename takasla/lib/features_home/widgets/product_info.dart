

import 'package:flutter/material.dart';
import 'package:takasla/features_home/screens/my_products_select_screen.dart';

import 'package:takasla/main/ui_components.dart';

import '../../main/constants.dart';

class ProductInfoItem extends StatelessWidget {
  const ProductInfoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            buildTakasUsername(),
            buildProductPhotos(context),
            buildProductName(),
            buildProductDescription(),
            buildCategoriesSelected(),
            buildProductButton(context),
          ],
        ),
      ),
    );
  }

  Container buildCategoriesSelected() {
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
                      child: Text('Kategori'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Kategori'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Kategori'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Kategori'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Kategori'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Kategori'),
                    ),

                  ],
                ),
              )
            ],
          ));
  }

  Container buildProductButton(context) {
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
              '1000 ₺',
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
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>MyProductScreen()));
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

  Container buildTakasUsername() => Container(
      padding: EdgeInsets.all(10),
      child: Text(
        'Takas Kullanıcısı Adı',
        style: TextStyle(color: colorOfMainTheme, fontSize: 20),
      ));
}

SingleChildScrollView buildProductPhotos(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.width / 2,
            child: Image.network(
              'https://images.pexels.com/photos/4397920/pexels-photo-4397920.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
              fit: BoxFit.contain,
            )),
        Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.width / 2,
            child: Image.network(
              'https://images.pexels.com/photos/4397920/pexels-photo-4397920.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
              fit: BoxFit.contain,
            )),
        Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.width / 2,
            child: Image.network(
              'https://images.pexels.com/photos/4397920/pexels-photo-4397920.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
              fit: BoxFit.contain,
            )),
      ],
    ),
  );
}

Container buildProductName() => Container(
    padding: EdgeInsets.all(15),
    child: Text(
      'Ürün Adı',
      style: TextStyle(color: colorOfMainTheme, fontSize: 20),
    ));

Container buildProductDescription() =>
    Container(padding: EdgeInsets.all(10), child: Text(lorem));
