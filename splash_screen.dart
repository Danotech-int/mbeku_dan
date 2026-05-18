import 'package:flutter/material.dart';
import 'dart:async/';
import '../screens/login_screen.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 194, 71),

      body: Center(
        child: Container(
          width: 180,
          height: 180,

          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),

            borderRadius:
                BorderRadius.circular(20),

            image: const DecorationImage(
              image: AssetImage(
                "mbeku_dan/assets/images/mbeku.png",
              ),

               fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}