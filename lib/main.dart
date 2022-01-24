import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:scheduler/Utils/constrain.dart';
import 'package:scheduler/responsive/responsive_main.dart';
import 'package:scheduler/responsive/responsive_mobile.dart';
import 'package:scheduler/responsive/responsive_web.dart';

// import 'Pages/Home_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyC6vVRu6C8VohEEhnniBMWd8BeHUfbzciw",
      appId: "1:601267492197:web:676dad572971e66431bd8c",
      messagingSenderId: "601267492197",
      projectId: "scheduler-fa14f",
      storageBucket: "scheduler-fa14f.appspot.com",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule For you',
      theme: ThemeData.dark(),
      home: const ResponsiveLayOut(
        androidLayout: MobileScreenLayout(),
        iosLayout: MobileScreenLayout(),
        webLayout: WebScreenLayout(),
      ),
    );
  }
}
