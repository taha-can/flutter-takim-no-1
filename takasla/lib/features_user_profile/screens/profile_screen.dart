import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:takasla/main/constants.dart';
import 'package:takasla/main/database_connection/firebase.dart';
import 'package:takasla/main/ui_components.dart';
import '../widget/product_info_arrange.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController searchProfile = TextEditingController();
  var current_user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.search,
                  color: colorOfMainTheme,
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomSearchInput(
                        color: colorOfMainTheme,
                        controller: searchProfile,
                        hintText: 'Arama'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: FirabaseService().GetProductsByUid(),
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    return current_user!.email == 'theteamflutterno1@gmail.com' ? Center(child: Text('Benim Ürünlerim'),):GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(8),
                      childAspectRatio: 0.8,
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      children: List.generate(
                          snapshot.data!.length,
                          (index) => CustomCard(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder) =>
                                        ProdcutInfoArrange(product: snapshot.data![index] ,)));
                              },
                              text: snapshot.data![index]['name'].toString().toUpperCase(),
                              imageUrl: snapshot.data![index]['photoproduct'] )),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator(color: colorOfMainTheme,));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
