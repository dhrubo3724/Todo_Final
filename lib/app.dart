import 'package:flutter/material.dart';
import 'package:todo_final/ui/screen/todolist_tab/todolist_screen.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodolistScreen(),
      theme: _lightTheme(),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
