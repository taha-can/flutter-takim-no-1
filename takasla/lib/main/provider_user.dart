






import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


currentUser(){
    var currentuid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('users').doc(currentuid).get().then((value){
      return value.data()!['name'];

    });
}