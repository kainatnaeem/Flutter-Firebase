class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class RegistorSuccessfullState extends AuthState {}

class AuthErrorState extends AuthState {
  String? errorMessege;
  AuthErrorState({this.errorMessege});
}
