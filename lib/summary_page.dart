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
  final String gender;

  SummaryPage(
      {required this.name,
      required this.age,
      required this.className,
      required this.profilePicture,
      required this.hobbies,
      required this.gender});

  List<String> changeHobbySubject() {
    List<String> newHobbies = [];
    for (var sentence in hobbies) {
      String eachHobby = name.isNotEmpty
          ? sentence
              .replaceAll("I", name)
              .replaceAll("my", gender.toLowerCase() == "male" ? "his" : "her")
          : sentence;
      newHobbies.add(eachHobby);
    }
    return newHobbies;
  }

  String _randomHobby() {
    List<String> newHobbies = changeHobbySubject();
    final random = (newHobbies..shuffle()).first;
    return random;
  }

  @override
  Widget build(BuildContext context) {
    String sex = gender.toLowerCase();
    String pronoun = sex == 'male' ? 'He' : 'She';
    String pronoun2 = gender == 'male' ? 'him' : 'her';
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "images/mm.png",
              scale: 12,
            ),
            Text(
              'Meet ${name.toUpperCase()}${age.isNotEmpty ? ", $age years old" : ""}',
              style: TextStyle(fontFamily: 'MyFont', fontSize: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.blueGrey)],
                    border: Border.all(color: Colors.blue, width: 10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      if (profilePicture != null)
                        Image.file(
                          File(profilePicture!.path),
                          width: 300,
                          height: 300,
                        ),
                      Text(
                        'Here is $name',
                        style: TextStyle(fontFamily: 'MyFont'),
                      ),
                      Text(
                          'A ${age.isNotEmpty ? "$age year old $sex student of \nTOP RANK MODEL COLLEGE" : " $sex student of \nTOP RANK MODEL COLLEGE"}${className.isNotEmpty ? "\n$pronoun is currently in $className" : ""}',
                          style: TextStyle(fontFamily: 'MyFont')),
                      Text(
                          "Click the 'fun fact' button to see \nsomething interesting about $pronoun2",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: 'MyFont')),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text(_randomHobby()),
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
      ),
    );
  }
}
