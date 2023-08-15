import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Models/user_model.dart';
import 'package:flutter_firebase/Repos/auth_repo.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  AuthRepository authRepository = AuthRepository();

  Future<void> registor(
      String email, String password, String confirmPassword) async {
    emit(AuthLoadingState());
    try {
      UserModel? userModel =
          await authRepository.Registor(email, password, confirmPassword);
      if (userModel != null) {
        emit(RegistorSuccessfullState(userModel: userModel));
      } else {
        emit(AuthErrorState(errorMessege: "Email is Already in use"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(errorMessege: e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoadingState());
    try {
      UserModel? user = await authRepository.login(email, password);
      if (user != null) {
        emit(LoginSuccessState(user: user));
      } else {
        emit(AuthErrorState(errorMessege: "Login Failed"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(errorMessege: e.toString()));
    }
  }
}
