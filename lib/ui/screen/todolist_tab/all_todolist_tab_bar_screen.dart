import 'package:flutter/material.dart';

import '../../../entities/Todo.dart';
import '../../widgets/TodoItems.dart';

class AllTodolistTabBarScreen extends StatelessWidget {
  const AllTodolistTabBarScreen(
      {super.key,
      required this.todoList,
      required this.onDelete,
      required this.onStatusChange});

  final List<Todo> todoList;
  final Function(int) onDelete;
  final Function(int) onStatusChange;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        Todo todo = todoList[index];

        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
            onDelete(index);
          },
          child: TodoItem(
            todo: todoList[index],
            onIconButtonPressed: () {
              onStatusChange(index);
            },
          ),
        );
      },
    );
  }

