import 'package:flutter/material.dart';
import 'package:flutter_firebase/Models/user_model.dart';
import 'package:flutter_firebase/Repos/auth_repo.dart';
import 'package:flutter_firebase/Utils/sharedpref_helper.dart';
import 'package:flutter_firebase/Utils/widgets/custom_appbar.dart';
import 'package:flutter_firebase/Views/auth/login_screen.dart';
import 'package:flutter_firebase/Views/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // UserModel userModel = args['userModel'];
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppbar(
            title: "Chats",
            leadingBackIcon: false,
          ),
          ElevatedButton(
              onPressed: () async {
                await SharedPreferenceHelper.logout();
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Text("Logout"))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () {
          Navigator.pushNamed(context, SearchScreen.routeName, arguments: {
            // "userModel": userModel,
          });
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
