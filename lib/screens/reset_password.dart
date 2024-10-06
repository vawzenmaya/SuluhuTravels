import 'package:flutter/material.dart';
import 'package:travels/screens/login.dart';
import 'package:travels/screens/widgets/primary_button.dart';
import 'package:travels/screens/widgets/reset_form.dart';
import 'package:travels/theme.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Image.asset(
                'assets/icons/app_icon.png', // Path to your app_icon.png
                height: 120, // Adjust the height as needed
                width: 120, // Adjust the width as needed
              ),
            ),
            const Center(
              child: Text(
                'Reset Password',
                style: TextStyle(
                    color: Color.fromARGB(255, 141, 29, 29),
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Please enter your email address',
              style: subTitle.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const ResetForm(),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInScreen(),
                      ));
                },
                child: PrimaryButton(
                  buttonText: 'Reset Password',
                  onPressed: () {},
                )),
          ],
        ),
      ),
    );
  }
}
