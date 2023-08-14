import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Utils/widgets/password_textfield.dart';
import 'package:flutter_firebase/Views/auth/login_screen.dart';
import 'package:flutter_firebase/Views/profile/user_profile.dart';
import 'package:flutter_firebase/bloc/auth-cubit/auth_cubit.dart';
import 'package:flutter_firebase/bloc/auth-cubit/auth_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/widgets/custom_appbar.dart';
import '../../Utils/widgets/custom_button.dart';
import '../../Utils/widgets/custom_textfiled.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register-screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

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

  void checkPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Password Does not match',
              style: GoogleFonts.kanit(color: Colors.black)),
          content: Text(
            'Please check Password.',
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
        if (state is RegistorSuccessfullState) {
          Navigator.pushNamed(context, UserProfileScreen.routeName);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Registration successful!"),
              backgroundColor: Colors.green,
            ),
          );
          clearControllers();
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
                title: "Registor",
              ),
              CustomTextField(
                label: "Email",
                controller: emailController,
              ),
              PasswordTextfield(
                label: "Password",
                controller: passwordController,
              ),
              PasswordTextfield(
                label: "Confirm Password",
                controller: confirmPasswordController,
              ),
              const SizedBox(
                height: 20,
              ),
              (state is AuthLoadingState)
                  ? Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.blue),
                    )
                  : CustombuttonWidget(
                      buttonHeight: 50,
                      buttonWidth: 330,
                      text: "Register",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      onPressed: () {
                        String email = emailController.text.trim();
                        String pasword = passwordController.text.trim();
                        String confirmPasword =
                            confirmPasswordController.text.trim();
                        if (email == '' ||
                            pasword == '' ||
                            confirmPasswordController == '') {
                          _showValidationDialog(context);
                        } else if (pasword != confirmPasword) {
                          checkPassword(context);
                        } else {
                          context
                              .read<AuthCubit>()
                              .registor(email, pasword, confirmPasword);
                        }
                      }),
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
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: Text(
                      "Login",
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
