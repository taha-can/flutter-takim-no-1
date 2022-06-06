import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/screens/main_body_screen.dart';
import 'package:takasla/main/ui_components.dart';
import 'package:takasla/widgets/main_body_appbar.dart';

class RejectScreen extends StatelessWidget {
  const RejectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMainScreenAppBar(context),
      body: Container(
        padding: EdgeInsets.all(80),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.close,
                color: rejectColor,
                size: 100,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Takas teklifiniz reddedildi :(',
                  style: TextStyle(color: colorOfMainTheme, fontSize: 25),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(
                  'Üzülme hemen yeni takaslar yapmaya başlayabilirsin',
                  style: TextStyle(color: colorOfMainTheme, fontSize: 20),
                ),
              ),
              CustomButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MainBodyScreen()));
                  },
                  child: Text('Anasayfa'),
                  color: colorOfMainTheme,
                  width: 200)
            ],
          ),
        ),
      ),
    );
  }
}
