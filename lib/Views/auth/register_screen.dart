import 'package:flutter/material.dart';
import 'package:flutter_firebase/Views/auth/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/widgets/custom_appbar.dart';
import '../../Utils/widgets/custom_button.dart';
import '../../Utils/widgets/custom_textfiled.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
            title: "Registor",
          ),
          CustomTextField(
            label: "Email",
            controller: emailController,
          ),
          CustomTextField(
            label: "Password",
            controller: passwordController,
          ),
          CustomTextField(
            label: "Confirm Password",
            controller: confirmPasswordController,
          ),
          const SizedBox(
            height: 20,
          ),
          CustombuttonWidget(
              buttonHeight: 50,
              buttonWidth: 330,
              text: "Register",
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
                "already have a account ? ",
                style: GoogleFonts.kanit(fontSize: 12, color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: Text(
                  "Login",
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
