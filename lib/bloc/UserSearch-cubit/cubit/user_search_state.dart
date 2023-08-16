import 'package:flutter_firebase/Models/user_model.dart';

abstract class UserSearchState {}

class UserSearchInitialState extends UserSearchState {}

class UserSearchLoadingState extends UserSearchState {}

class UserSearchSuccessState extends UserSearchState {
  final List<UserModel> users;

  UserSearchSuccessState(this.users);
}

class UserSearchErrorState extends UserSearchState {
  final String errorMessage;

  UserSearchErrorState(this.errorMessage);
}
