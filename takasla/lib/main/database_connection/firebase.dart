import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants.dart';

class FirabaseService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  LoginService(email, password) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return false;
      }
    }
  }

  Future SignUpService(name, surname, birtday, email, password) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('users').doc(user.user!.uid).set(({
            'id': user.user!.uid,
            'name': name,
            'surname': surname,
            'email': email,
            'birthday': birtday,
            'password': generateMd5(password),
            'bio': '',
            'phone': '',
          }));
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return false;
      } else if (e.code == 'email-already-in-use') {
        return 'Bu mail adresi ile bir hesap bulunmaktadır.';
      }
    } catch (e) {
      return false;
    }
  }

  Future UpdateProfile(user_id, name, email, phone, bio) async {
    try {
      await _firestore.collection('users').doc(user_id).set(({
            'id': user_id,
            'name': name,
            'email': email,
            'bio': bio,
            'phone': phone,
          }));
      return true;
    } catch (e) {
      return false;
    }
  }

  ResetPassword(email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<List> GetProductsAll() async {
    var products_list = [];

    try {
      var querysnap = await _firestore.collection('all_products').get();
      var liste = querysnap.docs.map((e) => e.data()).toList();
      for (var i = 0; liste.length > i; i++) {
        products_list.add(liste[i]);
      }

      return products_list;
    } catch (e) {
      return products_list;
    }
  }

  Future<List> GetProductsByUid() async {
    var products_list = [];

    try {
      var current_user = FirebaseAuth.instance.currentUser;
      var querysnap = await _firestore.collection('all_products').get();
      var liste = querysnap.docs.map((e) => e.data()).toList();
      for (var i = 0; liste.length > i; i++) {
        if (liste[i]['user_id'].toString() == current_user!.uid.toString()) {
          products_list.add(liste[i]);
        }
      }

      return products_list;
    } catch (e) {
      return products_list;
    }
  }

  AddProduct(product_id,category_id, name, price, product_dec, wanted_category,
      photoproduct) async {
    try {
      sleep(Duration(seconds: 5));
      var current_user = FirebaseAuth.instance.currentUser;
      await _firestore.collection('all_products').doc(product_id).set(({
            'product_id':product_id,
            'category_id': category_id,
            'name': name,
            'price': price,
            'product_dec': product_dec,
            'user_id': current_user!.uid,
            'wanted_category': wanted_category,
            'photoproduct': photoproduct,
          }));
      return true.toString();
    } catch (e) {
      return false.toString();
    }
  }

  UpdateProduct(product_id,category_id, name, price, product_dec, wanted_category,
      photoproduct) async {
    try {
      sleep(Duration(seconds: 2));
      var current_user = FirebaseAuth.instance.currentUser;
      await _firestore.collection('all_products').doc(product_id).set(({
        'product_id':product_id,
        'category_id': category_id,
        'name': name,
        'price': price,
        'product_dec': product_dec,
        'user_id': current_user!.uid,
        'wanted_category': wanted_category,
        'photoproduct': photoproduct,
      }));
      return true.toString();
    } catch (e) {
      return false.toString();
    }
  }



  DeleteProduct(product_id) async {
    try {
      sleep(Duration(seconds: 2));
      await _firestore.collection('all_products').doc(product_id).delete();
      return true.toString();
    } catch (e) {
      return false.toString();
    }
  }









  GetNameByUid(uid) async {
    var username = '';
    try {
      var querysnap = await _firestore.collection('users').get();
      var liste = querysnap.docs.map((e) => e.data()).toList();
      for (var i = 0; liste.length > i; i++) {
        if (liste[i]['id'].toString() == uid.toString()) {
          username = liste[i]['name'];
        }
      }

      return username;
    } catch (e) {
      return username;
    }
  }

  Future TradeAdd(
      userForTradeId,
      userToTradeId,
      offerid,
      productForTradeName,
      productForMyName,
      deliveryPlace,
      deliveryDate,
      userForTrade,
      userMe,
      userForTradeApprove,
      userForMyApprove,
      myProductPrice,
      tradeProductPrice,productForTradePhoto,productForMyPhoto) async {
    try {
      sleep(Duration(seconds: 1));

      var rng = new Random();
      var code = rng.nextInt(900000) + 100000;
      await _firestore.collection('trade').doc(offerid).set(({
        'deliverycode':code,
        'userForTradeId':userForTradeId,
        'userToTradeId':userToTradeId,
          'offerid':offerid,
            'productForTradeName': productForTradeName,
            'productForMyName': productForMyName,
            'deliveryPlace': deliveryPlace,
            'deliveryDate': deliveryDate,
            'userForTrade': userForTrade,
            'userMe': userMe,
            'userForTradeApprove': userForTradeApprove,
            'userForMyApprove': userForMyApprove,
            'myProductPrice': myProductPrice,
            'tradeProductPrice': tradeProductPrice,
        'productForTradePhoto':productForTradePhoto,
        'productForMyPhoto':productForMyPhoto,
          }));

      return true.toString();
    } catch (e) {
      return false.toString();
    }
  }



  TradeAll() async {
    var trade_list = [];
    try {
      var querysnap = await _firestore.collection('trade').get();
      var liste = querysnap.docs.map((e) => e.data()).toList();
      for (var i = 0; liste.length > i; i++) {
        trade_list.add(liste[i]);
      }
      return  trade_list;
    } catch (e) {
      return  trade_list;
    }
  }

Future TradeUpdate(offer_id,userForTradeApprove,userForMyApprove) async {
  try {
    sleep(Duration(seconds: 1));
    await _firestore.collection('trade').doc(offer_id).update(({
      'userForTradeApprove': userForTradeApprove,
      'userForMyApprove': userForMyApprove,
    }));

    return true.toString();
  } catch (e) {
    return false.toString();
  }




}



}
