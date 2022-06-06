import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';
import 'detail_offer.dart';

class CardDetailOffer extends StatelessWidget {
  var tradeNot;
  CardDetailOffer({Key? key, this.tradeNot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: CustomButton(
          onPressed: () {
            openDetailOffer(context);
          },
          child: Text('${tradeNot['userForTrade']} ${tradeNot['productForTradeName'].toString().toUpperCase()} ürünü için takasla teklifi geldi. '),
          color: colorOfMainTheme,
          width: MediaQuery.of(context).size.width / 1.1),
    );
  }
}
