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
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/input');
    });

    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 200, horizontal: 50),
        child: Center(
            child: Column(
          children: [
            Text(
              'MeetMeApp',
              style: TextStyle(fontSize: 50, fontFamily: 'MyFont'),
            ),
            Text(
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
            Image.asset("images/logo.png")
          ],
        )),
      )),
    );
  }
}
