


import 'package:flutter/material.dart';
import 'package:takasla/features_trade/screens/trade_screen.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';

class WelcomeTradeScreen extends StatefulWidget {
  const WelcomeTradeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeTradeScreen> createState() => _WelcomeTradeScreenState();
}

class _WelcomeTradeScreenState extends State<WelcomeTradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text('Ürünlerini yüklemeye hazır mısın ? :))))'),
            ),
          ),
          Container(padding: EdgeInsets.all(8), child:CustomButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (builder) => TradeScreen() ));}, child: Text('Haydi Başlayalım'), color: colorOfMainTheme, width: 200) ,)
        ],
      ),
    );
  }
}
