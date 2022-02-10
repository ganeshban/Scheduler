import 'package:flutter/material.dart';

class MyLoader extends StatelessWidget {
  const MyLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.pink,
      type: MaterialType.card,
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Theme.of(context).scaffoldBackgroundColor,
        width: 200,
        height: 200,
      ),
    );
  }
}

class MyChip extends StatelessWidget {
  final String title;
  final Color? backColor;
  final Color? foreColor;
  final VoidCallback? onDeleted;
  final IconData? trallingIcon;
  final IconData? leadingIcon;

  const MyChip(
    this.title, {
    Key? key,
    this.backColor,
    this.foreColor,
    this.onDeleted,
    this.trallingIcon,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(title),
      deleteIcon: Icon(trallingIcon, color: foreColor),
      onDeleted: onDeleted,
      elevation: 1,
      avatar: leadingIcon == null
          ? null
          : CircleAvatar(
              child: Icon(leadingIcon, color: foreColor),
              backgroundColor: backColor,
              foregroundColor: foreColor,
            ),
      backgroundColor: backColor,
      labelStyle: TextStyle(color: foreColor),
    );
  }
}
