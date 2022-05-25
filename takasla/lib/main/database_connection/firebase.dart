import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:takasla/main/provider_user.dart';


import '../constants.dart';

class FirabaseService{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  LoginService(email,password) async {

    var result = [];
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      var current = currentUser();

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

Future SignUpService(name,surname,birtday,email,password) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );
       await _firestore.collection('users').doc(user.user!.uid).set(({
          'id' : user.user!.uid,
          'name' : name,
          'surname' : surname,
          'email' : email,
          'birthday' : birtday,
          'password' : generateMd5(password),
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

  ResetPassword(email) async {

    try{
      await  _auth.sendPasswordResetEmail(email: email);
      return true;
    }on FirebaseAuthException catch (e) {
      return false;
    }


  }
}


