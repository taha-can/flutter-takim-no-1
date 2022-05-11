import 'package:flutter/material.dart';
import 'package:takasla/features_home/widgets/imageFullSize.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  TextEditingController controllerProductName = TextEditingController();
  TextEditingController controllerProductDes = TextEditingController();
  TextEditingController controllerProductPrice = TextEditingController();
  bool test = false;

  void dispose() {
    controllerProductDes.dispose();
    controllerProductPrice.dispose();
    controllerProductName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildAddProduct(),
    );
  }

  buildAddProduct() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FullImage(
                              imageURL:
                                  'https://images.pexels.com/photos/4397920/pexels-photo-4397920.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                            )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Image.network(
                      'https://images.pexels.com/photos/4397920/pexels-photo-4397920.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FullImage(
                              imageURL:
                                  'https://images.pexels.com/photos/4397920/pexels-photo-4397920.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                            )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Image.network(
                      'https://images.pexels.com/photos/4397920/pexels-photo-4397920.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildForm(),
        ],
      ),
    );
  }

  buildForm() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomInput(
              color: colorOfMainTheme,
              controller: controllerProductName,
              labelText: 'Ürün Adı',
              isPassword: false,
              maxlength: 50),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              maxLines: 8,
              minLines: 1,
              controller: controllerProductDes,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  labelText: 'Ürün Açıklaması',
                  labelStyle: TextStyle(color: colorOfMainTheme),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: colorOfMainTheme)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorOfMainTheme)))),
        ),
        GridView.count(
          padding: EdgeInsets.all(2),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 3,
          children: [
            Center(
                child: Row(
              children: [
                Checkbox(
                  value: test,
                  onChanged: (bool? value) {
                    setState(() {
                      test = value!;
                    });
                  },
                ),
                Text('Checkbox')
              ],
            )),
            Center(
                child: Row(
              children: [
                Checkbox(
                  value: test,
                  onChanged: (bool? value) {
                    setState(() {
                      test = value!;
                    });
                  },
                ),
                Text('Checkbox')
              ],
            )),
            Center(
                child: Row(
              children: [
                Checkbox(
                  value: test,
                  onChanged: (bool? value) {
                    setState(() {
                      test = value!;
                    });
                  },
                ),
                Text('Checkbox')
              ],
            )),
            Center(
                child: Row(
              children: [
                Checkbox(
                  value: test,
                  onChanged: (bool? value) {
                    setState(() {
                      test = value!;
                    });
                  },
                ),
                Text('Checkbox')
              ],
            )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 50.0, left: 15),
                child: CustomNumberInput(
                    color: colorOfMainTheme,
                    controller: controllerProductPrice,
                    labelText: 'Ürün Değeri',
                    isPassword: false,
                    maxlength: 50),
              ),
            ),
            Flexible(
                child: CustomButton(
                    onPressed: () {},
                    child: Text('Takasla'),
                    color: colorOfMainTheme,
                    width: 100))
          ],
        ),
      ],
    );
  }
}
