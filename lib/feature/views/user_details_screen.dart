import 'package:flutter/material.dart';
import 'package:mvvm_provider/components/app_title.dart';
import 'package:mvvm_provider/feature/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          usersViewModel.selectedUser!.name!,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              titleText: usersViewModel.selectedUser!.name!,
              // style: const TextStyle(color: Colors.black),
            ),
            Text(
              usersViewModel.selectedUser!.email!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(usersViewModel.selectedUser!.address!.city!),
            Text(usersViewModel.selectedUser!.company?.name ?? ''),
          ],
        ),
      ),
    );
  }
}
