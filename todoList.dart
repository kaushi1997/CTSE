import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app_lab01/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Todo> _todos = <Todo>[];
  TextStyle? _style(bool? checked) {
    if (!checked!) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Todo List")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                          hintText: "Add Todo",
                          contentPadding: EdgeInsets.all(8.0)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _todos.add(Todo(
                              name: _textEditingController.text,
                              checked: false));
                          _textEditingController.clear();
                        });
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: _todos.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Text(_todos[index].name,
                              style: _style(_todos[index].checked)),
                          leading: Checkbox(
                            value: _todos[index].checked,
                            onChanged: ((bool? value) {
                              setState(() {
                                _todos[index].checked = value;
                              });
                            }),
                          ),
                        );
                      }))),
            ],
          ),
        ));
  }
}
