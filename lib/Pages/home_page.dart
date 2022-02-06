import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String userName = '';
  @override
  void initState() {
    getUserName();
    super.initState();
  }

  void getUserName() async {
    DocumentSnapshot _snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();
    setState(() {
      userName = (_snap.data() as Map<String, dynamic>)['username'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userName),
            Container(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                  onPressed: () async {
                    await auth.signOut().then((_) {
                      getpage(context, "/login", replacedPage: true);
                    });
                  },
                  child: const Text("Log Out ")),
            )
          ],
        ),
      ),
    );
  }
}
