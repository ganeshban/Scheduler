import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final double height;
  final double? width;
  final Color? backColor;
  final Color? foreColor;
  final Icon icon;

  const MyButton(
      {Key? key,
      required this.title,
      required this.height,
      required this.width,
      required this.backColor,
      required this.foreColor,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: backColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(title, style: TextStyle(color: foreColor)),
        ],
      ),
    );
  }
}
