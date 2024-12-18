import 'package:flutter/material.dart';
import 'package:mvvm_provider/components/app_title.dart';
import 'package:mvvm_provider/feature/models/user_list_model.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final GestureTapCallback? onTap;

  const UserListRow({
    super.key,
    required this.userModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              titleText: userModel.name!,
              // style: const TextStyle(color: Colors.black),
            ),
            Text(
              userModel.email!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(userModel.address?.city ?? ''),
          ],
        ),
      ),
    );
  }
}
