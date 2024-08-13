import 'package:flutter/material.dart';
import 'package:meetme_app/splash_screen.dart';

void main() {
  runApp(MeetMeApp());
}

class MeetMeApp extends StatelessWidget {
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     initialRoute: '/',
  //     routes: {
  //       '/': (context) => SplashScreen(),
  //       // '/input': (context) => InputScreen(),
  //       // '/result': (context) => ResultScreen(
  //       //       user: ModalRoute.of(context)!.settings.arguments as User,
  //       //     ),
  //     },
  //   );
  // }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
