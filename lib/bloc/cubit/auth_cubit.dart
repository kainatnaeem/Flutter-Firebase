import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Repos/auth_repo.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  AuthRepository authRepository = AuthRepository();

  Future<void> Registor(
      String email, String password, String confirmPassword) async {
    emit(AuthLoadingState());
    try {
      var isUserRegistered =
          await authRepository.Registor(email, password, confirmPassword);
      if (isUserRegistered) {
        emit(RegistorSuccessfullState());
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(errorMessege: e.toString()));
    }
  }
}
