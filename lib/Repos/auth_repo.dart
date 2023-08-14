// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/Models/user_model.dart';

class AuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<bool> Registor(
      String email, String password, String confirmPassword) async {
    try {
      UserCredential? userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid;
      Map<String, dynamic> newUser =
          UserModel(uid: uid, email: email, fullname: '', profilepic: '')
              .toMap();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(newUser);

      return true; // Registration successful
    } on FirebaseAuthException catch (e) {
      Exception(e.toString());
      return false; // Registration failed
    }
  }

  Future<UserModel?> login(String email, String password) async {
    UserCredential credential;
    UserModel userModel;
    try {
      credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      String uid = credential.user!.uid;
      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      userModel = UserModel.fromMap(userData.data() as Map<String, dynamic>);
      return userModel;
    } catch (e) {
      Exception(e.toString());
      return null;
    }
  }
}
