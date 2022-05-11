import 'package:flutter/material.dart';



class FullImage extends StatelessWidget {
  late String imageURL;
   FullImage({Key? key,required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.close)),
              ],
            ),
            Center(child: Container(child: Image.network(imageURL),)),
          ],
        )));
  }
}

