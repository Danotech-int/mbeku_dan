import 'package:flutter/material.dart';
import '../widgets/custom_buttons.dart';
import '../widgets/custom_textfield.dart';
import '../screens/login_screen.dart';

class SignupScreen extends StatefulWidget{
  const SignupScreen({super.key});

@override
  State<SignupScreen> createState () => _SignupScreenState();

}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(padding: const EdgeInsets.all (20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Create An Account!",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),

          CustomTextField(
              hintText: "Name",
              controller: passwordController,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hintText: "Email",
              controller: emailController,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hintText: "Password",
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 20),

            CustomButton(
              text: "SignUp",
              onTap: () {
                print("Name: ${passwordController.text}");
                print("Email: ${emailController.text}");
                print("Password: ${passwordController.text}");
        },
      ),
    ],
      
      ),
    )
  );
  }
  
}

