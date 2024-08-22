import 'package:flutter/material.dart';
import 'package:meetme_app/splash_screen.dart';

void main() {
  runApp(MeetMeApp());
}

class MeetMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MeetMe',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Set the default font family here
        textTheme: const TextTheme(
          bodySmall: TextStyle(fontSize: 32.0),
          labelSmall:
              TextStyle(fontSize: 32), // Default font size for bodyText1
          bodyMedium:
              TextStyle(fontSize: 24.0), // Default font size for bodyText2
          headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),

//   titleLarge,
//    titleMedium,
// titleSmall,
//   bodyLarge,
//   TextStyle? bodyMedium,
//   TextStyle? bodySmall,
//   TextStyle? labelLarge,
          // Define other text styles as needed
        ),
      ),
      home: SplashScreen(),
    );
  }
}
