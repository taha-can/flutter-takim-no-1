import 'package:flutter/material.dart';
import 'package:takasla/features_offers/widgets/card_offer.dart';

class ComingOfferScreen extends StatelessWidget {
  const ComingOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: [
            CardDetailOffer(),
            CardDetailOffer(),
            CardDetailOffer(),
            CardDetailOffer(),
            CardDetailOffer(),
          ],
        ),
      ),
    );
  }
}




