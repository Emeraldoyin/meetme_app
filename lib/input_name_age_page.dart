import 'package:flutter/material.dart';

import 'input_class_page.dart';

class InputNameAgePage extends StatefulWidget {
  @override
  _InputNameAgePageState createState() => _InputNameAgePageState();
}

class _InputNameAgePageState extends State<InputNameAgePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 15.0,
        shadowColor: Colors.white,
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Image.asset(
              "images/mm.png",
              scale: 12,
            ),
            Text(
              'Enter Your Name and Age',
              style: TextStyle(
                fontFamily: 'MyFont',
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'First name'),
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ListTile(
                title: const Text('Male'),
                leading: Radio<String>(
                  value: 'male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Female'),
                leading: Radio<String>(
                  value: 'female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isEmpty) {
                    // Name is empty, show SnackBar for name
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text('Please enter your name'),
                      ),
                    );
                  } else if (gender == null) {
                    // Gender is not selected, show SnackBar for gender
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text('Please choose a gender'),
                      ),
                    );
                  } else {
                    // Both name and gender are provided, navigate to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputClassPage(
                          name: _nameController.text,
                          age: _ageController.text,
                          gender: gender ?? 'male',
                        ),
                      ),
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
