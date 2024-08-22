import 'package:flutter/material.dart';

import 'upload_profile_picture_page.dart';

class InputClassPage extends StatelessWidget {
  final String name;
  final String age;
  final String gender;

  InputClassPage({required this.name, required this.age, required this.gender});

  final TextEditingController _classController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "images/mm.png",
              scale: 12,
            ),
            Text(
              'Hello $name,',
              style: TextStyle(fontFamily: 'MyFont'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _classController,
              decoration: InputDecoration(
                  labelText: 'Insert your current class level (e.g Year 1)'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadProfilePicturePage(
                      name: name,
                      age: age,
                      className: _classController.text,
                      gender: gender,
                    ),
                  ),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
