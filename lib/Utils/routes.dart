import 'package:flutter/material.dart';
import 'package:flutter_firebase/Views/Chats%20screens/chat_room.dart';
import 'package:flutter_firebase/Views/ErrorPage/error_page.dart';
import 'package:flutter_firebase/Views/auth/login_screen.dart';
import 'package:flutter_firebase/Views/auth/register_screen.dart';
import 'package:flutter_firebase/Views/home/home_screen.dart';
import 'package:flutter_firebase/Views/profile/complete_profile.dart';
import 'package:flutter_firebase/Views/search/search_screen.dart';
import 'package:flutter_firebase/Views/splash%20screen/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const SplashScreen(), settings: settings);
    case LoginScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const LoginScreen(), settings: settings);
    case RegisterScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const RegisterScreen(), settings: settings);
    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const HomeScreen(), settings: settings);
    case CompleteProfileScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const CompleteProfileScreen(),
          settings: settings);
    case SearchScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const SearchScreen(), settings: settings);
    case Chatroom.routeName:
      return MaterialPageRoute(
          builder: (context) => const Chatroom(), settings: settings);
    default:
      return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
