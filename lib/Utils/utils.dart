import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

showSnackBar(BuildContext context, String data) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(data),
    ),
  );
}

getpage(BuildContext context, String routeName,
    {bool replacedPage = false, Object? param}) {
  if (replacedPage) {
    Navigator.popAndPushNamed(context, routeName, arguments: param);
  } else {
    Navigator.of(context).pushNamed(routeName, arguments: param);
  }
}

Future<void> setLocalData({required String key, required String value}) async {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final SharedPreferences pref = await _pref;
  await pref.setString(key, value);
}

Future<String?> getLocalData(
    {required String key, bool killAfterUsed = true}) async {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  SharedPreferences pref = await _pref;
  String data = pref.getString(key) ?? '';
  if (killAfterUsed) {
    await pref.remove(key);
  }
  return data;
}
