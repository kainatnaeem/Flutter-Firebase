import '../../Models/user_model.dart';

class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class RegistorSuccessfullState extends AuthState {
  final UserModel userModel;

  RegistorSuccessfullState({required this.userModel});
}

class LoginSuccessState extends AuthState {
  UserModel user;
  LoginSuccessState({required this.user});
}

class AuthErrorState extends AuthState {
  String? errorMessege;
  AuthErrorState({this.errorMessege});
}
