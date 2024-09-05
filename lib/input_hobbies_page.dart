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
  final List<String> namesOfStudents = [
    "Richard",
    "Daniel",
    "Marvelous",
    "Hameed",
    "Abimbola",
    "Temidayo",
    "Inioluwa",
    "Lola",
    "Mariam",
    "Adedoyinsola",
    "Idowu"
  ];

  final TextEditingController _hobbyController = TextEditingController();
  List<int> scores = [10, 20, 30, 40];

  void _addHobby() {
    int hobbyWords = _hobbyController.text.split(" ").length;
    if (hobbyWords >= 2) {
      setState(() {
        hobbies.add(_hobbyController.text);
      });
      _hobbyController.clear();
    } else {
      ScaffoldMessenger.of(context).ckBar(
        SnackBar(
          content: Text('Write at least two words about each of your hobby'),
        ),
      );
    }
  }

  void _deleteHobby(int index) {
    setState(() {
      hobbies.removeAt(index);
    });
  }

  Future<bool> confirmDelete(int index) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Are you sure you want to delete this hobby?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'One more thing, ${widget.name}',
              style: TextStyle(fontFamily: 'MyFont'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
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
                    return Dismissible(
                      // Wrap with Dismissible widget
                      key: UniqueKey(), // Generate unique key for each item
                      confirmDismiss: (direction) => confirmDelete(index),
                      child: ListTile(
                        leading: Icon(Icons.star),
                        title: Text(hobbies[index]),
                        // subtitle: Text(namesOfStudents[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteHobby(
                              index), // Call delete function directly
                        ),
                      ),
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
      ),
    );
  }
}
