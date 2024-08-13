import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'input_hobbies_page.dart';

class UploadProfilePicturePage extends StatefulWidget {
  final String name;
  final String age;
  final String className;

  UploadProfilePicturePage({
    required this.name,
    required this.age,
    required this.className,
  });

  @override
  _UploadProfilePicturePageState createState() =>
      _UploadProfilePicturePageState();
}

class _UploadProfilePicturePageState extends State<UploadProfilePicturePage> {
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile;
    });
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
            _imageFile == null
                ? Text('No image selected.')
                : Image.file(File(_imageFile!.path)),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Profile Picture'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputHobbiesPage(
                      name: widget.name,
                      age: widget.age,
                      className: widget.className,
                      profilePicture: _imageFile,
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
