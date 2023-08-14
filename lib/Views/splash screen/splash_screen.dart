import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/Utils/sharedpref_helper.dart';
import 'package:flutter_firebase/Views/home/home_screen.dart';
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
    bool isLoggedIn = await SharedPreferenceHelper.isLoggedIn();

    // Use Future.delayed instead of Timer.periodic
    Future.delayed(Duration(seconds: 3), () {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
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
