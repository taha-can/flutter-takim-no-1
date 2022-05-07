import 'package:flutter/material.dart';
import 'package:takasla/features_home/widgets/categoryItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(8.0),child: Container(
          child: GridView.count(
            crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5,
            children: [
            categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),

              categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),

              categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),

              categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),
          ],),
      ),)
    );
  }
}
