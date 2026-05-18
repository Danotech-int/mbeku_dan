import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_buttons.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login To Your Account!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            CustomTextField(
              hintText: "Email",
              controller: emailController,
            ),
            const SizedBox(height: 15),

            CustomTextField(
              hintText: "Password",
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 20),

            CustomButton(
              text: "Login",
              onTap: () {
                print("Email: ${emailController.text}");
                print("Password: ${passwordController.text}");
              },

              
            ),
          ],
        ),
      ),
    );
  }
}