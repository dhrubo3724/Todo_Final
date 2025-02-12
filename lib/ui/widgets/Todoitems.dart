import 'package:flutter/material.dart';

import '../../entities/Todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
    required this.onIconButtonPressed,
  });
  final Todo todo;
  final VoidCallback onIconButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      surfaceTintColor: _getCardTintColor(todo.isDone),
      child: ListTile(
          title: Text(
            todo.title,
            style: TextStyle(
              decoration: _getTextDecoration(todo.isDone),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.description),
              Text(todo.time.toString()),
            ],
          ),
          trailing: _buildRoundIconButton(todo.isDone)),
    );
  }

  Widget _buildRoundIconButton(bool isDone) {
    return GestureDetector(
      onTap: onIconButtonPressed,
      child: CircleAvatar(
        child: Icon(_getIcon(true)),
      ),
    );
  }

  IconData _getIcon(bool isDone) {
    return isDone ? Icons.check : Icons.clear;
  }

  TextDecoration? _getTextDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : null;
  }
}

Color? _getCardTintColor(bool isDone) {
  return isDone ? Colors.green : null;
}
