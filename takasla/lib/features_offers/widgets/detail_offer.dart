import 'package:flutter/material.dart';
import 'package:takasla/main.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';

Future<void> openDetailOffer(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Teklif @melis8 xxxx Ürünü'),
        content: Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(100),
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [Text('DatePicker')],
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(8), child: Text(('Ürün Adı')))
                  ],
                ),
                Text('İÇİN'),
                Row(
                  children: [],
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          CustomButton(
            width: 100,
            color: colorOfMainTheme,
            child: const Text('Reddet'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CustomButton(
            width: 100,
            color: colorOfMainTheme,
            child: const Text('Takasla'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
