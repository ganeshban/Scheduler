import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> singUpUser({
    required String phone,
    required String email,
    required String username,
  }) async {
    String msg = "gets into some error.";
    try {
      if (phone.isNotEmpty || email.isNotEmpty || username.isNotEmpty) {
        // create user
        UserCredential _cr = await _auth.createUserWithEmailAndPassword(
            email: email, password: phone);
        // Storing users other data
        _firestore.collection("users").doc(_cr.user!.uid).set({
          'phone': phone,
          'emial': email,
          'username': username,
          "userid": _cr.user!.uid,
        });
        msg = 'succes';
      } else {
        msg = 'All Fields are required';
      }
    } catch (e) {
      msg = e.toString();
    }

    return msg;
  }

  Future<String> singIn({required String phone}) async {
    String msg = "Wrong Entry";
    String email = "a$phone@gmail.com";
    try {
      if (phone.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: phone);
        msg = "succes";
      } else {
        msg = "Enter Your Phone";
      }           
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        //Code for signup
        msg = "new-user";
      }
    } catch (e) {
      msg = e.toString();
    }
    return msg;
  }
}

// Banganesh98@gmail.com
// Ganesh Ban