import 'package:flutter/material.dart';
import 'package:flutter_firebase/Utils/widgets/custom_appbar.dart';
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
    return Scaffold(
      body: const SafeArea(
          child: Column(
        children: [
          CustomAppbar(
            title: "Chats",
            leadingBackIcon: false,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () {
          Navigator.pushNamed(context, SearchScreen.routeName);
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
