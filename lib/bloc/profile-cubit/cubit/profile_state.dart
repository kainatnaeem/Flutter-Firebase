import 'package:flutter_firebase/Models/user_model.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileUpdatedState extends ProfileState {
  final UserModel userModel;
  final CroppedFile imagefile;
  ProfileUpdatedState(this.userModel, this.imagefile);
}

class ProfileErrorState extends ProfileState {
  final String? errorMessege;
  ProfileErrorState({this.errorMessege});
}
