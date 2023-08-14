import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Utils/widgets/custom_button.dart';
import 'package:flutter_firebase/Utils/widgets/custom_textfiled.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileScreen extends StatefulWidget {
  static const routeName = '/profile-screen';
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController fullNameController = TextEditingController();
  void showPhotoOption() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Upload Profile Picture",
            style: GoogleFonts.kanit(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.image),
                title: Text("upload from gallery"),
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Take a picture"),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView(
          children: [
            CupertinoButton(
                onPressed: () {
                  showPhotoOption();
                },
                child: const CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.blueAccent,
                  ),
                )),
            CustomTextField(
              label: "Full Name",
              controller: fullNameController,
            ),
            const SizedBox(
              height: 30,
            ),
            CustombuttonWidget(
              onPressed: () {},
              buttonHeight: 50,
              buttonWidth: 330,
              text: "Submit",
            )
          ],
        ),
      )),
    );
  }
}
