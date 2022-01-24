
import 'package:flutter/cupertino.dart';

import 'package:scheduler/Utils/constrain.dart';

class ResponsiveLayOut extends StatelessWidget {
  final Widget webLayout;
  final Widget iosLayout;
  final Widget androidLayout;

  const ResponsiveLayOut({
    Key? key,
    required this.webLayout,
    required this.androidLayout,
    required this.iosLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webLayout;
        } else {
          return androidLayout;
        }
      },
    );
  }
}
