import 'package:flutter/material.dart';
import 'package:scheduler/modals/user.dart';
import 'package:scheduler/resources/firebase_auth.dart';

class UserProviders extends ChangeNotifier {
  ModelUser? _user;
  final AuthMethods _authMethods = AuthMethods();

  ModelUser get getUser => _user!;
  Future<void> refreshData() async {
    ModelUser user = await _authMethods.getUser();
    _user = user;
    notifyListeners();
  }
}
