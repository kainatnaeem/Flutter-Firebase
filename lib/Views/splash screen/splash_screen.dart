import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  void navigateToHome() async {
    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Center(
        child: Text(
          "Chat App",
          style: GoogleFonts.kanit(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      )),
    );
  }
}
