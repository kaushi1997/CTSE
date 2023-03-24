import 'package:flutter/material.dart';
import 'todoList.dart';

void main() {
  runApp(const MaterialApp(
    home: TodoList(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My ToDo List"),
      ),
    );
  }
}
