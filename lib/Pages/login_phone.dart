import 'package:flutter/material.dart';
import 'package:scheduler/Utils/text_box.dart';

class LoginByPhone extends StatefulWidget {
  const LoginByPhone({Key? key}) : super(key: key);

  @override
  State<LoginByPhone> createState() => _LoginByPhoneState();
}

class _LoginByPhoneState extends State<LoginByPhone> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Container(), flex: 2),
          const FlutterLogo(size: 100),
          const SizedBox(height: 50),
          TextBox(
            txtController: _phoneController,
            hintText: "Enter Your Phone to continue",
            textInputType: TextInputType.phone,
          ),
          const SizedBox(height: 30),
          TextButton(onPressed: () {}, child: const Text("Continue")),
          ElevatedButton(
            onPressed: () {},
            child: const Text("data"),
          ),
        ],
      ),
    );
  }
}
