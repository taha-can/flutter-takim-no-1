import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';

import '../../main/ui_components.dart';

class TradeDelivery extends StatefulWidget {
  var productChange;
  var productForTrade;
  String dodToSend;
  String deliverycenter;
  TradeDelivery(
      {Key? key,
      required this.productChange,
      required this.productForTrade,
      required this.dodToSend,
      required this.deliverycenter})
      : super(key: key);

  @override
  State<TradeDelivery> createState() => _TradeDeliveryState();
}

class _TradeDeliveryState extends State<TradeDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.check,color: approvedColor,size: 100,),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child:
                    Text('Teklifiniz Gönderildi Takas Kullanıcısı Tarafından Onay bekliyor',style: TextStyle(fontWeight: FontWeight.w900),)
                ),
              ),
              Container(padding:EdgeInsets.all(8),alignment: Alignment.centerLeft,child:
                Text('Takaslamak istediğiniz ürün : ${widget.productForTrade['name']}',style: TextStyle(color: colorOfMainTheme,fontSize: 20),)
              ),
              Container(padding:EdgeInsets.all(8),alignment: Alignment.centerLeft,child:
              Text('Takasladığınız ürün : ${widget.productChange['name']}',style: TextStyle(color: colorOfMainTheme,fontSize: 20),)
              ),
              Container(padding:EdgeInsets.all(8),alignment: Alignment.center,child:
              Column(
                children: [
                  Text('Tercih Ettiğiniz Takas Gönderim Yeri ',style: TextStyle(color: colorOfMainTheme,fontSize: 15),),
                  Text('${widget.deliverycenter}')
                ],
              )
              ),
              Container(padding:EdgeInsets.all(8),alignment: Alignment.center,
                  child:
              Column(
                children: [
                  Text('Tercih Ettiğiniz Takas Gönderim Tarihi ',style: TextStyle(color: colorOfMainTheme,fontSize: 15),),
                  Text('${widget.dodToSend}')
                ],
              )
            ),
              Container(
                padding: EdgeInsets.all(10),
                child: CustomButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('Ana Sayfa'), color: colorOfMainTheme, width: 200),
              )
            ],
          ),
        ),
      ),
    );
  }
}
