import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/pages/home_page.dart';
import 'package:scheduler/pages/login_phone.dart';
import 'package:scheduler/pages/signup_details.dart';
import 'package:scheduler/providers/user_providers.dart';
import 'package:scheduler/responsive/responsive_main.dart';
import 'package:scheduler/responsive/responsive_mobile.dart';
import 'package:scheduler/responsive/responsive_web.dart';


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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProviders(),
        )
      ],
      child: MaterialApp(
        title: 'Schedule For you',
        theme: ThemeData.dark(), //.copyWith(primaryColor: primaryColor),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => const LoginByPhone(),
          '/signup': (BuildContext context) => const SignUpPage(),
          '/home': (BuildContext context) => const HomePage(),
          '/LoadUser': (BuildContext context) => const LoginByPhone(),
          '/searchPage': (BuildContext context) => const LoginByPhone(),
          '/settingPage': (BuildContext context) => const LoginByPhone(),
          '/dashboardPage': (BuildContext context) => const LoginByPhone(),
          '/LoanPage': (BuildContext context) => const LoginByPhone(),
          '/Report': (BuildContext context) => const LoginByPhone(),
        },
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayOut(
                    webLayout: WebScreenLayout(),
                    androidLayout: MobileScreenLayout(),
                    iosLayout: MobileScreenLayout());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const LoginByPhone();
          },
        ),
      ),
    );
  }
}
