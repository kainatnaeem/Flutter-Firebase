import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Models/user_model.dart';
import 'package:flutter_firebase/bloc/UserSearch-cubit/cubit/user_search_state.dart';

class UserSearchCubit extends Cubit<UserSearchState> {
  UserSearchCubit() : super(UserSearchInitialState());
  void searchUsers(String searchText) async {
    if (searchText.isEmpty) {
      emit(UserSearchInitialState());
      return;
    }

    emit(UserSearchLoadingState());

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('fullname', isGreaterThanOrEqualTo: searchText)
          .get();

      final List<UserModel> users = querySnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      emit(UserSearchSuccessState(users));
    } catch (e) {
      emit(UserSearchErrorState('Error searching for users.'));
    }
  }
}
