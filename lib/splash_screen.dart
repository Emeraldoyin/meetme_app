import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
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
