import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for SystemNavigator

class EndSessionPage extends StatefulWidget {
  @override
  _EndSessionPageState createState() => _EndSessionPageState();
}

class _EndSessionPageState extends State<EndSessionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: _animation.value,
              child: Icon(
                Icons.stars,
                size: 120,
                color: Colors.blue,
              ),
              // child: Image.asset(
              //   'images/school_logo.png',
              //   scale: 2,
              // ),
            ),
            SizedBox(height: 20),
            Text(
              'Take a Bow!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Back to Start'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                SystemNavigator.pop(); // Exits the app safely
              },
              child: Text(
                'Exit',
                style: TextStyle(
                    color: Colors.black,
                    shadows: [Shadow(color: Colors.white)]),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
