import 'dart:math';

import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/screens/main_body_screen.dart';
import 'package:takasla/main/ui_components.dart';
import 'package:takasla/widgets/main_body_appbar.dart';

class ApprovedScreen extends StatelessWidget {
  var info;
  ApprovedScreen({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {





    return Scaffold(
      appBar: buildMainScreenAppBar(context),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Icon(
                  Icons.check,
                  color: approvedColor,
                  size: 100,
                ),
              ),
              Container(
                child: Text(
                  'Teklifin Onaylandı :)',
                  style: TextStyle(color: colorOfMainTheme, fontSize: 25),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Aşağıdaki kargo numarsıyla teslimat noktalarına ürünü gönderebilirsin,teslimat noktalarındaki görevlilerimiz ürünlerin doğruluğunu sizin için kontrol edip takas işlemini gerçekleştirecektir ve talep ettiğiniz ürünü adresinize kargolayacaklardır.',
                  style: TextStyle(color: colorOfMainTheme, fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Takas noktasına ürününüzü kargolarken lütfen teslim adresinizi kargo şirketi görevlisine söylemeyi unutmayınız',
                  style: TextStyle(color: colorOfMainTheme, fontSize: 18),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Teslimat Bilgileri',
                      style: TextStyle(
                          color: rejectColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    Text(
                      'Teslimat Yeri : ${info['deliveryPlace']}',
                      style: TextStyle(color: colorOfMainTheme, fontSize: 16),
                    ),
                    Text(
                      'En geç teslimat günü : ${info['deliveryDate']}',
                      style: TextStyle(color: colorOfMainTheme, fontSize: 16),
                    ),
                    Text(
                      'Yurtiçi Kargo Teslimat Kodu : ${info['deliverycode']}',
                      style: TextStyle(color: colorOfMainTheme, fontSize: 16),
                    ),
                    Text(
                      'Takas edeceğim ürünüm : ${info['productForTradeName']}',
                      style: TextStyle(color: colorOfMainTheme, fontSize: 16),
                    ),
                    Text(
                      'Takas etmek istediğim ürün: ${info['productForMyName']}',
                      style: TextStyle(color: colorOfMainTheme, fontSize: 16),
                    ),
                    CustomButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainBodyScreen()));
                        },
                        child: Text('Anasayfa'),
                        color: approvedColor,
                        width: 200)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
