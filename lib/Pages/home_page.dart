import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/modals/user.dart';
import 'package:scheduler/providers/user_providers.dart';
import 'package:scheduler/utils/constrain.dart';
import 'package:scheduler/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  // PageController
  int page = 0;

  @override
  Widget build(BuildContext context) {
    ModelUser modelUser = Provider.of<UserProviders>(context).getUser;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(modelUser.username),
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
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: page,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        onTap: (value) {
          setState(() {
            page = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "Store",
            backgroundColor: primaryColor,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "Employee",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: modelUser.username,
          ),
        ],
      ),
    );
  }
}
