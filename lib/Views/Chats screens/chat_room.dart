import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Models/user_model.dart';
import 'package:flutter_firebase/Repos/auth_repo.dart';
import 'package:flutter_firebase/Utils/widgets/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Chatroom extends StatefulWidget {
  static const routeName = '/chatroom-screen';
  const Chatroom({super.key});

  @override
  State<Chatroom> createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    UserModel targetUser = args["targetUser"];
    //  User? firebaseUser = AuthRepository.logedInUser;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppbar(title: targetUser.fullname),
          Expanded(child: Container()),
          Container(
            color: Colors.grey.shade300.withOpacity(0.3),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: EdgeInsets.symmetric(vertical: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    child: TextField(
                  style: GoogleFonts.kanit(fontSize: 15, color: Colors.black26),
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade200.withOpacity(0.2),
                      filled: true,
                      border: InputBorder.none,
                      hintText: "Enter Messege",
                      hintStyle: GoogleFonts.kanit(
                          fontSize: 15, color: Colors.black26)),
                )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      size: 30,
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
