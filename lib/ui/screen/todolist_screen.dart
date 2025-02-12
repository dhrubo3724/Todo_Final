import 'package:flutter/material.dart';
import 'package:todo_final/entities/Todo.dart';
import 'package:todo_final/ui/screen/add_new_screen.dart';
import 'package:todo_final/ui/widgets/Todoitems.dart';

class TodolistScreen extends StatefulWidget {
  const TodolistScreen({super.key});

  @override
  State<TodolistScreen> createState() => _TodolistScreenState();
}

class _TodolistScreenState extends State<TodolistScreen> {
  List<Todo> _todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {},
            child: TodoItem(
              todo:
                  Todo('Title will here', 'Description ijahfj', DateTime.now()),
              onIconButtonPressed: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewScreen()),
          );
        },
        tooltip: 'Add New Todo',
        label: Text("Add New Todo"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
