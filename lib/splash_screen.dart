import 'package:flutter/material.dart';

import 'start_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay of 3 seconds before navigating to the StartPage
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Center(
              child: Column(
        children: [
          Image.asset(
            "images/mm.png",
            width: 200,
            height: 300,
          ),
          const Text(
            'MeetMeApp',
            style: TextStyle(fontSize: 50, fontFamily: 'MyFont'),
          ),
          const Text(
            "for",
            style: TextStyle(
                color: const Color.fromARGB(
                  255,
                  139,
                  32,
                  24,
                ),
                fontSize: 25),
          ),
          Text(
            "Marvelous",
            style: TextStyle(fontFamily: 'MyFont', fontSize: 40),
          ),
          Image.asset("images/logo.png")
        ],
      ))),
    );
  }
}
