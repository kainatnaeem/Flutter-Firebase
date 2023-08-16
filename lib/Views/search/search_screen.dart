import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/Models/user_model.dart';
import 'package:flutter_firebase/Repos/auth_repo.dart';
import 'package:flutter_firebase/Utils/widgets/custom_appbar.dart';
import 'package:flutter_firebase/Utils/widgets/custom_textfiled.dart';
import 'package:flutter_firebase/Views/Chats%20screens/chat_room.dart';

import '../../bloc/UserSearch-cubit/cubit/user_search_cubit.dart';
import '../../bloc/UserSearch-cubit/cubit/user_search_state.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/Search-Screen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(title: "User Search"),
          CustomTextField(
            onChange: (searchText) {
              String currentUserId = FirebaseAuth.instance.currentUser!.uid;
              context
                  .read<UserSearchCubit>()
                  .searchUsers(searchText.trim(), currentUserId);
            },
            hintText: 'Search',
          ),
          Expanded(
            child: BlocBuilder<UserSearchCubit, UserSearchState>(
              builder: (context, state) {
                if (state is UserSearchInitialState) {
                  return const Center(child: Text('Enter a search term'));
                } else if (state is UserSearchLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserSearchSuccessState) {
                  final users = state.users;
                  if (users.isEmpty) {
                    return const Center(child: Text('No users found'));
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, Chatroom.routeName,
                                arguments: {
                                  "targetUser": user,
                                });
                          },
                          title: Text(user.fullname ?? ''),
                          subtitle: Text(user.email ?? ''),
                          leading: user.profilepic != null
                              ? CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(user.profilepic!))
                              : const Icon(Icons.person),
                        );
                      },
                    ),
                  );
                } else if (state is UserSearchErrorState) {
                  return Center(child: Text(state.errorMessage));
                }

                return Container(); // Handle other cases as needed
              },
            ),
          ),
        ],
      ),
    );
  }
}
