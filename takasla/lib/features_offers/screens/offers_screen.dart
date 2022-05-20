import 'package:flutter/material.dart';
import '../../main/constants.dart';
import 'coming_screen.dart';
import 'sending_screen.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  var showWidgets = [ComingOfferScreen(), SendingOfferScreen()];
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Column(
              children: [
                TextButton(
                  style: index == 0
                      ? ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width / 2.2,
                              MediaQuery.of(context).size.width / 10)),
                          backgroundColor:
                              MaterialStateProperty.all(colorOfMainTheme))
                      : ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/2.2, MediaQuery.of(context).size.width/10)),
                      backgroundColor:
                              MaterialStateProperty.all(Colors.transparent)),
                  child: Text(
                    'Gelen Teklifler',
                    style: TextStyle(
                        color: index == 0 ? Colors.white : colorOfMainTheme),
                  ),
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                TextButton(
                  style: index == 1
                      ? ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width / 2.2,
                              MediaQuery.of(context).size.width / 10)),
                          backgroundColor:
                              MaterialStateProperty.all(colorOfMainTheme))
                      : ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/2.2, MediaQuery.of(context).size.width/10)),
                      backgroundColor:
                              MaterialStateProperty.all(Colors.transparent)),
                  child: Text(
                    'Giden Teklifler',
                    style: TextStyle(
                        color: index == 1 ? Colors.white : colorOfMainTheme),
                  ),
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
      body: showWidgets[index],
    );
  }
}
