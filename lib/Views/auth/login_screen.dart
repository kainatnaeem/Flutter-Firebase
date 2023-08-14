import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Utils/sharedpref_helper.dart';
import 'package:flutter_firebase/Views/auth/register_screen.dart';
import 'package:flutter_firebase/Views/home/home_screen.dart';
import 'package:flutter_firebase/bloc/auth-cubit/auth_cubit.dart';
import 'package:flutter_firebase/bloc/auth-cubit/auth_state.dart';
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
  void _showValidationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Validation Error'),
          content: Text(
            'Please fill the TextBoxs.',
            style: GoogleFonts.kanit(color: Colors.black),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushNamed(context, HomeScreen.routeName,
              arguments: {"email": state.user!.email});
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login successful!"),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessege.toString()),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
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
              (state is AuthLoadingState)
                  ? Center(child: CircularProgressIndicator())
                  : CustombuttonWidget(
                      buttonHeight: 50,
                      buttonWidth: 330,
                      text: "Login",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      onPressed: () async {
                        String? email = emailController.text.trim();
                        String? password = passwordController.text.trim();
                        if (email == '' || password == '') {
                          _showValidationDialog(context);
                        } else {
                          context.read<AuthCubit>().login(email, password);
                          await SharedPreferenceHelper.setLoggedIn(true);
                          await SharedPreferenceHelper.setEmail(email);
                          await SharedPreferenceHelper.setPassword(password);
                        }
                      }),
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
                      style:
                          GoogleFonts.kanit(fontSize: 13, color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          )),
        );
      },
    );
  }
}
