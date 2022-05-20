import 'package:flutter/material.dart';

import '../widgets/card_offer.dart';

class SendingOfferScreen extends StatelessWidget {
  const SendingOfferScreen({Key? key}) : super(key: key);

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
