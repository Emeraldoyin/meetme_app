import 'package:flutter/material.dart';

import 'input_name_age_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              "images/mm.png",
              scale: 1.5,
            ),
            Text(
                style: TextStyle(fontFamily: "MyFont", fontSize: 25),
                "Welcome to MeetMeApp!\nAre you ready to introduce yourself?\nClick the start buttton to begin"),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 120,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputNameAgePage()),
                  );
                },
                child: Text('Start'),
                style: ButtonStyle(
                    textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 24))),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Image.asset(
              "images/school_logo.png",
              scale: 3,
            ),
          ],
        ),
      ),
    );
  }
}
