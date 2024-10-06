import 'package:flutter/material.dart';
import 'package:travels/screens/login.dart';
import 'package:travels/screens/widgets/checkbox.dart';
import 'package:travels/screens/widgets/login_option.dart';
import 'package:travels/screens/widgets/primary_button.dart';
import 'package:travels/screens/widgets/signup_form.dart';
import 'package:travels/theme.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Center(
                child: Image.asset(
                  'assets/icons/app_icon.png', // Path to your app_icon.png
                  height: 120, // Adjust the height as needed
                  width: 120, // Adjust the width as needed
                ),
              ),
            const Padding(
              padding: kDefaultPadding,
              child: Center(
                child: Text(
                  'Create Account',
                style: TextStyle(
                    color: Color.fromARGB(255, 141, 29, 29),
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                children: [
                  Text(
                    'Already a member?',
                    style: subTitle,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()));
                    },
                    child: Text(
                      'Log In',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline, color: const Color.fromARGB(255, 141, 29, 29),
                        decorationThickness: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: kDefaultPadding,
              child: SignUpForm(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: kDefaultPadding,
              child: CheckBox('Agree to terms and conditions.'),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: PrimaryButton(buttonText: 'Sign Up', onPressed: () {  },),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Or SignUp with:',
                style: subTitle.copyWith(color: kBlackColor),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: kDefaultPadding,
              child: LoginOption(),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}