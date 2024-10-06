import 'package:flutter/material.dart';
import 'package:travels/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Method to navigate to LogInScreen after 5 seconds
  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5), () {});  // Increased to 5 seconds
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LogInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 141, 29, 29),  // Set background color to red
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Center image and progress indicator
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/splash.png',  // Splash image
                      height: 200,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'SULUHU TRAVELS',  // Text under the image
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Text at the bottom of the screen
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                '©Develop With Effect',  // Footer text
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
