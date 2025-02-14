import 'package:flutter/material.dart';

import '../../../entities/Todo.dart';
import '../../widgets/TodoItems.dart';

class UndoneTodolistTabBarScreen extends StatelessWidget {
  const UndoneTodolistTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {},
          child: TodoItem(
            todo: Todo('Title will here', 'Description ijahfj', DateTime.now()),
            onIconButtonPressed: () {},
          ),
        );
      },
    );
  }
}
