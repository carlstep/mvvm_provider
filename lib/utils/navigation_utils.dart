import 'package:flutter/material.dart';
import 'package:mvvm_provider/feature/views/add_user_screen.dart';
import 'package:mvvm_provider/feature/views/user_details_screen.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const UserDetailsScreen(),
    ),
  );
}

void openAddUser(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const AddNewUserScreen(),
    ),
  );
}
