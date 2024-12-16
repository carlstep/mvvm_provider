// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String titleText;

  const AppTitle({
    super.key,
    this.titleText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        titleText,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
