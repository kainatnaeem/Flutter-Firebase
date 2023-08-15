import 'package:flutter/material.dart';
import 'package:flutter_firebase/Utils/sharedpref_helper.dart';
import 'package:flutter_firebase/Views/auth/login_screen.dart';
import 'package:flutter_firebase/Views/profile/complete_profile.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("HomeScreen"),
          ),
          ElevatedButton(
              onPressed: () async {
                await SharedPreferenceHelper.logout();
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: const Text("Logout")),
          ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              },
              child: const Text("UserProfile"))
        ],
      )),
    );
  }
}
