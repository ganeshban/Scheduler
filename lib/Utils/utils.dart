import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String data) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(data),
    ),
  );
}

getpage(BuildContext context, String routeName, {bool replacedPage = false}) {
  if (replacedPage) {
    Navigator.popAndPushNamed(context, routeName);
  } else {
    Navigator.of(context).pushNamed(routeName);
  }
}
