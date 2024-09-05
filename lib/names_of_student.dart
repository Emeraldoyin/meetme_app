import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NamesOfStudent(),
  ));
}

class NamesOfStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Names of students in the class"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Students in the class are as follows"),
            ElevatedButton(onPressed: () {}, child: Text("Come in"))
          ],
        ),
      ),
    );
  }
}
