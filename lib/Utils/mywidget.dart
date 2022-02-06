import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myButton(
    {required String title,
    required IconData icon,
    required Color backColor,
    double width = 0}) {
  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Text(title),
        ],
      ),
    ),
    padding: const EdgeInsets.all(8.0),
    width: width == 0 ? double.infinity : width,
    height: kToolbarHeight * 0.6,
    decoration: const BoxDecoration(
        color: Colors.blueAccent, shape: BoxShape.rectangle),
  );
}

class MyLoader extends StatelessWidget {
  const MyLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
