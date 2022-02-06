import 'package:flutter/material.dart';
import 'package:scheduler/resources/firebase_auth.dart';
import 'package:scheduler/utils/text_box.dart';
// import 'package:scheduler/utils/mywidget.dart';
import 'package:scheduler/utils/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  String phone = '9840756006';

  @override
  void initState() {
    getLocalData(key: 'phone').then(setPhone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        color: Colors.white24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Container(), flex: 3),
            const FlutterLogo(size: 100),
            const SizedBox(height: 50),
            MyTextBox(
              txtController: _phone,
              hintText: "Your Phone",
              textInputType: TextInputType.phone,
              enabled: false,
            ),
            const SizedBox(height: 10),
            MyTextBox(
              txtController: _email,
              hintText: "Enter Your Email",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            MyTextBox(
              txtController: _userName,
              hintText: "Enter Your Full Name",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 30),
            Text(phone),
            TextButton(
              onPressed: () async {
                String myData;
                myData = await AuthMethods().singUpUser(
                    phone: _userName.text,
                    email: _email.text,
                    username: _userName.text);
                if (myData == "succes") {
                  getpage(context, "/home", replacedPage: true);
                } else {
                  showSnackBar(context, myData);
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

  void setPhone(String? phone) {
    setState(() {
      this.phone = phone.toString();
      _phone.text = this.phone;
    });
  }
}
