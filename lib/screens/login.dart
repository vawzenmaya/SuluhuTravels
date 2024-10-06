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
              const SizedBox(height: 120),
              Text('Welcome Back', style: titleText),
              const SizedBox(height: 5),
              Row(
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
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
                    color: kZambeziColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              Text('Or log in with:', style: subTitle.copyWith(color: kBlackColor)),
              const SizedBox(height: 20),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}