import 'package:flutter/material.dart';
import 'package:mvvm_provider/components/app_error.dart';
import 'package:mvvm_provider/components/app_loading.dart';

import 'package:mvvm_provider/components/user_list_row.dart';
import 'package:mvvm_provider/feature/models/user_list_model.dart';
import 'package:mvvm_provider/utils/navigation_utils.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_provider/feature/view_models/users_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            onPressed: () async {
              openAddUser(context);
            },
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _ui(usersViewModel),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    usersViewModel.sortByName();
                  },
                  child: Text('Sort By Name'),
                ),
                OutlinedButton(
                  onPressed: () {
                    usersViewModel.sortByCity();
                  },
                  child: Text('Sort By City'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return const AppLoading();
    }
    if (usersViewModel.userError != null) {
      return AppError(errorTxt: usersViewModel.userError!.message.toString());
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = usersViewModel.userListModel[index];
          return UserListRow(
            userModel: userModel,
            onTap: () async {
              usersViewModel.setSelectedUser(userModel);
              openUserDetails(context);
            },
            onLongPress: () {
              // TODO remove user from database
              // display a warning dialog box with two options - cancel or confirm
              usersViewModel.removeUser(userModel);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(
          color: Colors.transparent,
        ),
        itemCount: usersViewModel.userListModel.length,
      ),
    );
  }
}
