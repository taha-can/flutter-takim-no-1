import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main/constants.dart';
import '../../main/database_connection/firebase.dart';
import '../widgets/card_offer.dart';

class SendingOfferScreen extends StatelessWidget {
  const SendingOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var current_user = FirebaseAuth.instance.currentUser;
    return Container(
      child: Center(
          child: FutureBuilder(builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return  ListView(
                children:
                List.generate(
                  snapshot.data!.length,
                      (index) => current_user!.uid == snapshot.data![index]['userToTradeId'] ? CardDetailOffer(tradeNot: snapshot.data[index],) : Container(),),
              );
            }else{
              return CircularProgressIndicator(color: colorOfMainTheme,);
            }
          },future: FirabaseService().TradeAll(),)

      ),
    );
  }
}
