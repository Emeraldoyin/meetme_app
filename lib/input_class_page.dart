import 'package:flutter/material.dart';

import 'upload_profile_picture_page.dart';

class InputClassPage extends StatefulWidget {
  final String name;
  final String age;
  final String gender;

  InputClassPage({required this.name, required this.age, required this.gender});

  @override
  State<InputClassPage> createState() => _InputClassPageState();
}

class _InputClassPageState extends State<InputClassPage> {
  final TextEditingController _classController = TextEditingController();

  String? selectedClass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 15.0,
        backgroundColor: Colors.blue,
        shadowColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              "images/mm.png",
              scale: 12,
            ),
            Text(
              'Hello ${widget.name},',
              style: TextStyle(fontFamily: 'MyFont'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedClass,
              decoration: InputDecoration(
                labelText: 'Select your current class level',
                border: OutlineInputBorder(),
              ),
              items: [
                'Year 7',
                'Year 8',
                'Year 9',
                'Year 10',
                'Year 11',
                'Year 12'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedClass = newValue; // Save the selected value
                });
              },
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
                      name: widget.name,
                      age: widget.age,
                      className: selectedClass ?? "",
                      gender: widget.gender,
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
