import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatefulWidget {
  static const routeName = '/error-screen';
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          "Something went wrong",
          style: GoogleFonts.kanit(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
