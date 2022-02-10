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
    String msg = "";
    try {
      //User Name must contain First Name and Last Name
      if (!username.contains(' ') && username.length < 3) {
        msg = 'Please enter first Name and Last Name';
      }

      //Email format must be valid
      if (!(email.length > 5 &&
          email.toUpperCase().contains(".COM") &&
          email.contains('@'))) {
        msg = 'Email format is bad.';
      }

      //All Fields must be filled
      if (email.isEmpty && username.isEmpty) {
        msg = 'All Fields are required';
      }

      //Phone NO Must be Present
      if (phone.isEmpty) {
        msg = "go-back";
      }

      // create user
      if (msg.isEmpty) {
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
