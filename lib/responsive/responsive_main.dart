import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:scheduler/Utils/constrain.dart';
import 'package:scheduler/providers/user_providers.dart';

class ResponsiveLayOut extends StatefulWidget {
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
  State<ResponsiveLayOut> createState() => _ResponsiveLayOutState();
}

class _ResponsiveLayOutState extends State<ResponsiveLayOut> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    UserProviders _providers = Provider.of(context, listen: false);
    await _providers.refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.webLayout;
        } else {
          return widget.androidLayout;
        }
      },
    );
  }
}
