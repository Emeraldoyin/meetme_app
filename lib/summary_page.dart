import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'end_session_page.dart';

class SummaryPage extends StatelessWidget {
  final String name;
  final String age;
  final String className;
  final XFile? profilePicture;
  final List<String> hobbies;

  SummaryPage({
    required this.name,
    required this.age,
    required this.className,
    required this.profilePicture,
    required this.hobbies,
  });

  String _randomHobby() {
    final random = (hobbies..shuffle()).first;
    return random;
  }

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
            if (profilePicture != null) Image.file(File(profilePicture!.path)),
            Text('Name: $name'),
            Text('Age: $age'),
            Text('Class: $className'),
            Text('Hobbies: ${hobbies.join(', ')}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Fun Fact: ${_randomHobby()}'),
                  ),
                );
              },
              child: Text('Fun Fact'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EndSessionPage(),
                  ),
                );
              },
              child: Text('End Session'),
            ),
          ],
        ),
      ),
    );
  }
}
