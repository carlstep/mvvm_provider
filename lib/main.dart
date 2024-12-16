import 'package:flutter/material.dart';
import 'package:mvvm_provider/feature/view_models/users_view_model.dart';
import 'package:mvvm_provider/feature/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'MVVM + Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
