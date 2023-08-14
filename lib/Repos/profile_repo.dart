import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(PickedFile imageFile) async {
    try {
      final Reference storageReference =
          _storage.ref().child('images/${DateTime.now()}.png');
      final UploadTask uploadTask =
          storageReference.putFile(File(imageFile.path));
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Error uploading image.');
    }
  }
}
