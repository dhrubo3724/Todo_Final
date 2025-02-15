import 'package:flutter/material.dart';
import 'package:todo_final/entities/Todo.dart';
import 'package:todo_final/ui/screen/add_new_screen.dart';
import 'package:todo_final/ui/screen/todolist_tab/all_todolist_tab_bar_screen.dart';
import 'package:todo_final/ui/screen/todolist_tab/done_todolist_tab_bar_screen.dart';
import 'package:todo_final/ui/screen/todolist_tab/undone_todolist_tab_bar_screen.dart';

class TodolistScreen extends StatefulWidget {
  const TodolistScreen({super.key});

  @override
  State<TodolistScreen> createState() => _TodolistScreenState();
}

class _TodolistScreenState extends State<TodolistScreen>
    with SingleTickerProviderStateMixin {
  //late TabController _tabController = TabController(length:3,vsync: this)
  final List<Todo> _todoList = [];
  // @override
  // void initState() {
  //
  //   super.initState();
  //_tabController = TabController(length:3,vsync:this)
  // }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todo List"),
          bottom: _buildTabBar(),
        ),
        body: TabBarView(children: [
          AllTodolistTabBarScreen(
            onDelete: (int index) {
              _deleteTodo(index);
            },
            onStatusChange: (int index) {
              _toggleTodoStatus(index);
            },
            todoList: _todoList,
          ),
          DoneTodoTabBarScreen(),
          UndoneTodolistTabBarScreen(),
        ]),
        floatingActionButton: _buildAddFloatingActionButton(),
      ),
    );
  }

  FloatingActionButton _buildAddFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddNewScreen(
                    onAddTodo: _addNewTodo(Todo as Todo),
                  )),
        );
      },
      tooltip: 'Add New Todo',
      label: Text("Add New Todo"),
      icon: Icon(Icons.add),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(tabs: [
      Text("All"),
      Text("UnDone"),
      Text("Done"),
    ]);
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleTodoStatus(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}
