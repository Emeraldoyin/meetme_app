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
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 12.0,
        shadowColor: Colors.white,
        backgroundColor: Colors.pink,
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
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ListTile(
                title: const Text('man'),
                leading: Radio<String>(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('woman'),
                leading: Radio<String>(
                  value: 'woman',
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
                  if (gender != null) {
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
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.white,
                        content: Text('Please choose a gender'),
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
