import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheduler/modals/user.dart';
// import 'package:firebase_core/firebase_core.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ModelUser> getUser() async {
    User user = _auth.currentUser!;
    DocumentSnapshot snapshot =
        await _firestore.collection("users").doc(user.uid).get();
    return ModelUser.fromMap(snapshot);
  }

  Future<String> singUpUser({
    required String phone,
    required String email,
    required String username,
  }) async {
    String msg = "gets into some error.";
    try {
      if (phone.isNotEmpty && email.isNotEmpty && username.isNotEmpty) {
        if (!username.contains(' ')) {
          return 'Please enter first Name and Last Name';
        }

        if (email.length > 5 &&
            email.toUpperCase().contains(".COM") &&
            email.contains('@')) {
          // create user
          UserCredential _cr = await _auth.createUserWithEmailAndPassword(
              email: 'abc$phone@gmail.com', password: phone);
          ModelUser _user = ModelUser(
              phone: phone,
              username: username,
              email: email,
              userid: _cr.user!.uid);
          // Storing users other data
          _firestore.collection("users").doc(_cr.user!.uid).set(_user.toJson());
          msg = 'succes';
        } else {
          msg = 'Email format is bad.';
        }
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
    String email = "abc$phone@gmail.com";
    try {
      if (phone.isNotEmpty) {
        if (phone.length != 10) {
          return 'invalid phone number';
        }
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