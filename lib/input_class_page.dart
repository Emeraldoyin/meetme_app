import 'package:flutter/material.dart';

import 'upload_profile_picture_page.dart';

class InputClassPage extends StatelessWidget {
  final String name;
  final String age;

  InputClassPage({required this.name, required this.age});

  final TextEditingController _classController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name, $age'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _classController,
              decoration: InputDecoration(labelText: 'Class'),
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
