import 'package:flutter/material.dart';
import 'package:meetme_app/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        // '/input': (context) => InputScreen(),
        // '/result': (context) => ResultScreen(
        //       user: ModalRoute.of(context)!.settings.arguments as User,
        //     ),
      },
    );
  }
}
