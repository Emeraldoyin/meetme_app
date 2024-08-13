import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'summary_page.dart';

class InputHobbiesPage extends StatefulWidget {
  final String name;
  final String age;
  final String className;
  final XFile? profilePicture;

  InputHobbiesPage({
    required this.name,
    required this.age,
    required this.className,
    required this.profilePicture,
  });

  @override
  _InputHobbiesPageState createState() => _InputHobbiesPageState();
}

class _InputHobbiesPageState extends State<InputHobbiesPage> {
  final List<String> hobbies = [];

  final TextEditingController _hobbyController = TextEditingController();

  void _addHobby() {
    if (_hobbyController.text.length >= 10) {
      setState(() {
        hobbies.add(_hobbyController.text);
      });
      _hobbyController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}, ${widget.age}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _hobbyController,
              decoration: InputDecoration(labelText: 'Enter a hobby'),
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
