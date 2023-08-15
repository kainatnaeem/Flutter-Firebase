import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Models/user_model.dart';
import 'package:flutter_firebase/Repos/profile_repo.dart';
import 'package:flutter_firebase/bloc/profile-cubit/cubit/profile_state.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());
  ProfileRepository profileRepository = ProfileRepository();
  Future<void> uploadData(
      String fullname, UserModel user, CroppedFile imageFile) async {
    emit(ProfileLoadingState());
    try {
      bool isData =
          await profileRepository.uploadData(fullname, user, imageFile);
      if (isData) {
        emit(ProfileUpdatedState(user, imageFile));
      }
    } on Exception catch (e) {
      emit(ProfileErrorState(errorMessege: e.toString()));
    }
  }
}
