import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Models/user_model.dart';
import 'package:flutter_firebase/Utils/widgets/custom_button.dart';
import 'package:flutter_firebase/Utils/widgets/custom_textfiled.dart';
import 'package:flutter_firebase/Views/home/home_screen.dart';
import 'package:flutter_firebase/bloc/profile-cubit/cubit/profile_cubit.dart';
import 'package:flutter_firebase/bloc/profile-cubit/cubit/profile_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileScreen extends StatefulWidget {
  static const routeName = '/profile-screen';
  const CompleteProfileScreen({
    super.key,
  });
  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  CroppedFile? imageFile;
  UserModel? userModel;
  User? firebaseUser;
  TextEditingController fullNameController = TextEditingController();

  void selectImage(ImageSource source) async {
    var pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      cropImage(XFile(pickedFile.path));
    }
  }

  void cropImage(XFile file) async {
    CroppedFile? cropImage = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 20,
    );
    if (cropImage != null) {
      setState(() {
        imageFile = cropImage;
      });
    }
  }

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
                onTap: () {
                  Navigator.pop(context);
                  selectImage(ImageSource.gallery);
                },
                leading: const Icon(Icons.image),
                title: const Text("upload from gallery"),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  selectImage(ImageSource.camera);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take a picture"),
              )
            ],
          ),
        );
      },
    );
  }

  void _showValidationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Validation Error'),
          content: Text(
            'Please fill the fields.',
            style: GoogleFonts.kanit(color: Colors.black),
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (userModel == null || firebaseUser == null) {
      Map<String, dynamic> args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      userModel = args['userModel'];
      firebaseUser = args['firebaseUser'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdatedState) {
          Navigator.pushNamed(context, HomeScreen.routeName, arguments: {
            'userModel': userModel,
            'firebaseUser': firebaseUser
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Profile Updated!"),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is ProfileErrorState) {
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
              child: Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ListView(
              children: [
                CupertinoButton(
                    onPressed: () {
                      showPhotoOption();
                    },
                    child: CircleAvatar(
                        backgroundImage: (imageFile != null)
                            ? FileImage(File(imageFile!.path))
                            : null,
                        radius: 60,
                        child: (imageFile == null)
                            ? const Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.blueAccent,
                              )
                            : null)),
                CustomTextField(
                  label: "Full Name",
                  controller: fullNameController,
                ),
                const SizedBox(
                  height: 30,
                ),
                (state is ProfileLoadingState)
                    ? const Center(child: CircularProgressIndicator())
                    : CustombuttonWidget(
                        onPressed: () {
                          String fullname = fullNameController.text.trim();
                          if (fullname == '' || imageFile == null) {
                            _showValidationDialog(context);
                          } else {
                            if (fullname != '' || imageFile != null) {
                              context
                                  .read<ProfileCubit>()
                                  .uploadData(fullname, userModel!, imageFile!);
                            }
                          }
                        },
                        buttonHeight: 50,
                        buttonWidth: 330,
                        text: "Submit",
                      )
              ],
            ),
          )),
        );
      },
    );
  }
}
