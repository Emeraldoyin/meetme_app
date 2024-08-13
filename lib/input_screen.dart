import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//import 'io.flutter.plugins.imagepicker.ImagePickerPlugin';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();
  // XFile? pickedImage;

  // Future<void> pickImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     pickedImage = pickedFile;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: ... input fields and buttons
    throw UnimplementedError();
  }
}
