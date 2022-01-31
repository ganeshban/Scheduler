import 'package:flutter/material.dart';
import 'package:scheduler/Utils/text_box.dart';
import 'package:scheduler/resources/firebase_auth.dart';
import 'package:scheduler/utils/utils.dart';

// import 'package:scheduler/utils/my_button.dart';
// import '';
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Container(), flex: 3),
            const FlutterLogo(size: 100),
            const SizedBox(height: 50),
            TextBox(
              txtController: _phoneController,
              hintText: "Enter Your Phone to continue",
              textInputType: TextInputType.phone,
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () async {
                String myData;
                myData =
                    await AuthMethods().singIn(phone: _phoneController.text);
                if (myData == "succes") {
                  getpage(context, "/home", replacedPage: true);
                } else if (myData == '') {
                  getpage(context, "/signup");
                }
              },
              child: const Text("Continue"),
            ),
            const SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
}
