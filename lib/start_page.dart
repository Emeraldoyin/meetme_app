import 'package:flutter/material.dart';

import 'input_name_age_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InputNameAgePage()),
            );
          },
          child: Text('Start'),
        ),
      ),
    );
  }
}
