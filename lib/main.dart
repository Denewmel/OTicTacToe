import 'package:flutter/material.dart';
import 'screens/menu_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTacToe',
      theme: ThemeData.light(),
      home: const MenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
