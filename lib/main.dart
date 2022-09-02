import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/theme_manager.dart';
import 'package:mini_store_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Store APP',
      theme: ThemeManager.themeData(),
      home: const HomeScreen(),
    );
  }
}
