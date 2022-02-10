import 'package:flutter/material.dart';
import 'package:scheduler/resources/firebase_auth.dart';
import 'package:scheduler/utils/constrain.dart';
import 'package:scheduler/utils/my_button.dart';
import 'package:scheduler/utils/text_box.dart';
import 'package:scheduler/utils/utils.dart';
import 'package:scheduler/utils/mywidget.dart' as mw;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  String phone = '';

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
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Container(), flex: 3),
            const mw.MyCard(),
            // const FlutterLogo(size: 100),
            const SizedBox(height: 30),
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
            const Divider(),
            const SizedBox(height: 30),
            MyButton(
              "Continue",
              foreColor: Colors.white,
              onClick: () async {
                String myData;
                myData = await AuthMethods().singUpUser(
                    phone: _phone.text,
                    email: _email.text,
                    username: _userName.text);
                if (myData == "succes") {
                  getpage(context, homePage, replacedPage: true);
                } else if (myData == "go-back") {
                  getpage(context, logInPage);
                } else {
                  showSnackBar(context, myData);
                }
              },
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
