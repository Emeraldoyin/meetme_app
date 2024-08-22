import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'summary_page.dart';

class InputHobbiesPage extends StatefulWidget {
  final String name;
  final String age;
  final String className;
  final XFile? profilePicture;
  final String gender;

  InputHobbiesPage(
      {required this.name,
      required this.age,
      required this.className,
      required this.profilePicture,
      required this.gender});

  @override
  _InputHobbiesPageState createState() => _InputHobbiesPageState();
}

class _InputHobbiesPageState extends State<InputHobbiesPage> {
  final List<String> hobbies = [];

  final TextEditingController _hobbyController = TextEditingController();

  void _addHobby() {
    int hobbyWords = _hobbyController.text.split(" ").length;
    if (hobbyWords >= 2) {
      setState(() {
        hobbies.add(_hobbyController.text);
      });
      _hobbyController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Write at least three words about each of your hobby'),
        ),
      );
    }
  }

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
              'One more thing, ${widget.name}',
              style: TextStyle(fontFamily: 'MyFont'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Tell us at least three of your hobbies",
              style: TextStyle(fontFamily: 'MyFont'),
            ),
            TextField(
              controller: _hobbyController,
              decoration: InputDecoration(labelText: 'enter a hobby'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _addHobby,
              child: Text('Add Hobby'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: hobbies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(hobbies[index]),
                  );
                },
              ),
            ),
            if (hobbies.length >= 3)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryPage(
                        name: widget.name,
                        age: widget.age,
                        className: widget.className,
                        profilePicture: widget.profilePicture,
                        hobbies: hobbies,
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
