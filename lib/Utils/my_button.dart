import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Color? backColor;
  final Color? foreColor;
  final IconData? icon;
  final VoidCallback onClick;
  final VoidCallback? onLongPress;

  const MyButton(
    this.title, {
    Key? key,
    this.height = 0,
    this.width = 0,
    this.backColor,
    this.foreColor,
    this.icon,
    required this.onClick,
    this.onLongPress,
  }) : //assert(width == 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttonTheme = Theme.of(context).buttonTheme;
    double myHeight = height == 0 ? buttonTheme.height : height;
    double myWidth = width == 0 ? buttonTheme.minWidth : width;
    Color fontColor = foreColor ?? Theme.of(context).scaffoldBackgroundColor;
    Color buttonColor = backColor ?? Theme.of(context).secondaryHeaderColor;
    Text myTitle = Text(title, style: TextStyle(color: fontColor));
    return Material(
      shadowColor: const Color(0x802196f3),
      color: buttonColor,
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        height: myHeight,
        minWidth: myWidth,
        onPressed: onClick,
        onLongPress: onLongPress,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: fontColor),
            const SizedBox(width: 5),
            myTitle,
          ],
        )),
      ),
    );
  }
}
