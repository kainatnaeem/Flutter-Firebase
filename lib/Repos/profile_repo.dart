import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase/Models/user_model.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> uploadData(
      String fullname, UserModel user, CroppedFile imageFile) async {
    try {
      UploadTask? uploadTask = FirebaseStorage.instance
          .ref("profilePicture")
          .child(user.uid.toString())
          .putData(await imageFile.readAsBytes());
      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();
      user.profilepic = imageUrl;
      user.fullname = fullname;
      await _firestore.collection("users").doc(user.uid).set(user.toMap());

      return true;
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }
}
