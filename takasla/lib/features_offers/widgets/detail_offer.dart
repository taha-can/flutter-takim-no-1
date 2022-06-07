import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:takasla/features_offers/screens/approved_offer.dart';
import 'package:takasla/features_offers/screens/reject_offer.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/database_connection/firebase.dart';
import 'package:takasla/main/ui_components.dart';

Future<void> openDetailOffer(context, offer) async {
  var current_user = FirebaseAuth.instance.currentUser;
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      var result;
      var color;
      if(offer['userForMyApprove'] && offer['userForTradeApprove'] ){
        result = 'Onaylandı';
        color = approvedColor;
      }else if(offer['userForMyApprove'] == true && offer['userForTradeApprove']== false ){
        result = 'Bekliyor';
        color = HexColor('b5af02');
      }
      else{
        result = 'Reddedildi';
        color = rejectColor;
      }
      return AlertDialog(
        title: Text(
            'Teklif @${offer['userMe']}  ${offer['productForTradeName']} Ürünü'),
        content: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(8),
                      child: Text(
                          '${offer['productForMyName']} ürününü  ${offer['productForTradeName']} ile takas etmek istiyor.'),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Image.network(
                                offer['productForTradePhoto'],
                                width: 80,
                                height: 80,
                              ),
                              Text('${offer['productForTradeName']}'),
                              Container(
                                child: Text(' ${offer['myProductPrice']} ₺'),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.network(
                                offer['productForMyPhoto'],
                                width: 80,
                                height: 80,
                              ),
                              Text('${offer['productForMyName']}'),
                              Container(
                                child: Text(' ${offer['tradeProductPrice']} ₺'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Text('Takas Noktası'),
                              ),
                              Text('${offer['deliveryPlace']}'),
                            ],
                          ),
                          Container(
                            child: Text(
                                'Takas Tarihi : ${offer['deliveryDate']} '),
                          )
                        ],
                      ),
                    )

              ],
            ),
          ),
        ),
        actions: <Widget>[
      current_user!.uid == offer['userToTradeId'] || result == 'Onaylandı' || result == 'Reddedildi' ?
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  onPressed: () {
                    if(result == 'Onaylandı'){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ApprovedScreen(info: offer,)));
                    }else if (result == 'Reddedildi'){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RejectScreen()));
                    }else{
                      Navigator.of(context).pop();
                    }

                  },
                  child:  Text(result),
                  color: color,
                  width: 200)
            ],
          ):
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                width: 100,
                color: colorOfMainTheme,
                child: Text('Reddet'),
                onPressed: () async {
                  final snackBar = SnackBar(
                    content: Text('Bir Hata Oluştu'),
                  );
                  var response = await FirabaseService().TradeUpdate(offer['offerid'], false,false).then((value)=>value.toString());
                  response == 'true' ?
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RejectScreen())):
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              CustomButton(
                width: 100,
                color: colorOfMainTheme,
                child: const Text('Takasla'),
                onPressed: () async {
                  final snackBar = SnackBar(
                    content: Text('Bir Hata Oluştu'),
                  );
                  var response = await FirabaseService().TradeUpdate(offer['offerid'], true,true).then((value)=>value.toString());
                  response == 'true' ?
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ApprovedScreen(info: offer,))):
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
