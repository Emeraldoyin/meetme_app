import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'input_hobbies_page.dart';

class UploadProfilePicturePage extends StatefulWidget {
  final String name;
  final String age;
  final String className;
  final String gender;

  UploadProfilePicturePage(
      {required this.name,
      required this.age,
      required this.className,
      required this.gender});

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
        elevation: 15.0,
        backgroundColor: Colors.blue,
        shadowColor: Colors.white,
        title: Text(
          'Great Job, ${widget.name}!',
          style: TextStyle(fontFamily: 'MyFont'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: _imageFile == null
                    ? Text(
                        'Select a profile image from your gallery',
                        style: TextStyle(fontFamily: 'MyFont'),
                      )
                    : Image.file(
                        File(_imageFile!.path),
                        scale: 1,
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _pickImage,
                child: _imageFile == null
                    ? Text('Pick Profile Picture')
                    : Text('Change Profile Picture'),
              ),
              ElevatedButton(
                onPressed: () {
                  //  _imageFile != null
                  // ?
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InputHobbiesPage(
                        name: widget.name,
                        age: widget.age,
                        className: widget.className,
                        profilePicture: _imageFile,
                        gender: widget.gender,
                      ),
                    ),
                  );
                  // : ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text('Please pick a picture to continue'),
                  //       duration: Duration(seconds: 1),
                  //     ),
                  //   );
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
