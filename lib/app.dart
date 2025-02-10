import 'package:flutter/material.dart';
import 'package:todo_final/ui/screen/todolist_screen.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodolistScreen(),
    );
  }
}
