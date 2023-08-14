import 'package:flutter/material.dart';
import 'package:flutter_firebase/Views/auth/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/widgets/custom_appbar.dart';
import '../../Utils/widgets/custom_button.dart';
import '../../Utils/widgets/custom_textfiled.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          const CustomAppbar(
            title: "Login",
          ),
          CustomTextField(
            label: "Email",
            controller: emailController,
          ),
          CustomTextField(
            label: "Password",
            controller: passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          CustombuttonWidget(
              buttonHeight: 50,
              buttonWidth: 330,
              text: "Login",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              onPressed: () {}),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "don't have a account ? ",
                style: GoogleFonts.kanit(fontSize: 12, color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: Text(
                  "Register",
                  style: GoogleFonts.kanit(fontSize: 13, color: Colors.blue),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
