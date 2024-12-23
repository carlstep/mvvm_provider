import 'package:flutter/material.dart';
import 'package:mvvm_provider/feature/models/user_list_model.dart';
import 'package:mvvm_provider/feature/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class AddNewUserScreen extends StatelessWidget {
  const AddNewUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Enter a name'),
              onChanged: (val) async {
                usersViewModel.addingUser?.name = val;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Enter an email'),
              onChanged: (val) async {
                usersViewModel.addingUser?.email = val;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Enter City'),
              onChanged: (val) async {
                usersViewModel.addingUser?.address ??= Address();
                usersViewModel.addingUser?.address?.city = val;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () async {
                bool userAdded = await usersViewModel.addUser();
                if (!userAdded) {
                  return;
                }

                Navigator.pop(context);
              },
              child: const Text('Add New User'),
            ),
          ],
        ),
      ),
    );
  }
}
