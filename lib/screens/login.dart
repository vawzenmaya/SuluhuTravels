import 'package:flutter/material.dart';
import 'package:travels/screens/reset_password.dart';
import 'package:travels/screens/signup.dart';
import 'package:travels/screens/widgets/login_form.dart';
import 'package:travels/screens/widgets/login_option.dart';
import 'package:travels/screens/widgets/primary_button.dart';
import 'package:travels/theme.dart';
import 'package:travels/screens/home_page.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40), // Adjusted height for better spacing
              Center(
                child: Image.asset(
                  'assets/icons/app_icon.png',
                  height: 120,
                  width: 120,
                ),
              ),
              const SizedBox(height: 6), // More space for clarity
              Center(
                child: Column(
                  children: [
                    Text("Welcome",
                      style: TextStyle(
                        color: Color.fromARGB(255, 141, 29, 29),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("To",
                      style: TextStyle(
                        color: Color.fromARGB(255, 141, 29, 29),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Suluhu Travels",
                      style: TextStyle(
                        color: Color.fromARGB(255, 141, 29, 29),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New to this app?', style: subTitle),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        color: const Color.fromARGB(255, 141, 29, 29),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const LogInForm(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Color.fromARGB(222, 142, 48, 48),
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                buttonText: 'Log In',
                onPressed: () {
                  // Add login authentication here before navigating
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: Text('Or log in with:', style: subTitle.copyWith(color: kBlackColor)),
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildButton(
                    iconImage: Image(
                      height: 30,
                      width: 30,
                      image: AssetImage('assets/icons/google.png'),
                    ),
                    textButton: 'Google',
                  ),
                  // Add more social login options here if needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
