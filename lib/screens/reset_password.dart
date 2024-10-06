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
      appBar: AppBar(
        title: const Text('Reset Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the login screen
          },
        ),
        backgroundColor: const Color.fromARGB(255, 255, 253, 253), // Match your theme color
      ),
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30), // Adjusted height
              Center(
                child: Image.asset(
                  'assets/icons/app_icon.png',
                  height: 120,
                  width: 120,
                ),
              ),
              const Center(
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Color.fromARGB(255, 141, 29, 29),
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Please enter your email address',
                style: subTitle.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const ResetForm(),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInScreen(),
                    ),
                  );
                },
                child: PrimaryButton(
                  buttonText: 'Reset Password',
                  onPressed: () {
                    // Handle reset password logic here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
