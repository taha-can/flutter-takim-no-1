import 'package:flutter/material.dart';
import 'package:takasla/features_home/widgets/product_info.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/ui_components.dart';

import '../../features_home/screens/my_products_select_screen.dart';
import '../widget/product_info_arrange.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController searchProfile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
                  Row(
                    children: [
                      Icon(Icons.search,color: colorOfMainTheme,),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomSearchInput(color: colorOfMainTheme, controller: searchProfile, hintText: 'Arama'),
                        ),
                      ),
                      Icon(Icons.filter_alt_rounded,color: colorOfMainTheme,)
                    ],
                  ),

            Expanded(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(8),
                childAspectRatio: 0.55,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [

                  CustomCard(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ProdcutInfoArrange()));
                      },
                      text: 'Ürün',
                      imageUrl:
                      'https://images.pexels.com/photos/3731256/pexels-photo-3731256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
