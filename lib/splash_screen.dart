import 'package:flutter/material.dart';
import 'start_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller and animation
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    // Delay of 4 seconds before navigating to the StartPage
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min, // This reduces unnecessary space
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height /
                    1, // Set height to half the screen size
                child: Image.asset(
                  "images/mm21.png",
                  fit: BoxFit.cover, // Ensure image fills the container
                ),
              ),
            ),
            // SizedBox(height: 10), // Add a small gap between the logo and text
            FadeTransition(
              opacity: _animation,
              child: const Text(
                'MeetMeApp',
                style: TextStyle(fontSize: 50, fontFamily: 'MyFont'),
              ),
            ),
            FadeTransition(
              opacity: _animation,
              child: const Text(
                "for",
                style: TextStyle(
                  color: Color.fromARGB(255, 139, 32, 24),
                  fontSize: 25,
                ),
              ),
            ),
            FadeTransition(
              opacity: _animation,
              child: Text(
                "Senior Students",
                style: TextStyle(fontFamily: 'MyFont', fontSize: 40),
              ),
            ),
            SizedBox(height: 10), // Add a small gap between the text and logo
            ScaleTransition(
              scale: _animation,
              child: Image.asset("images/logo.png"),
            ),
          ],
        ),
      ),
    );
  }
}
