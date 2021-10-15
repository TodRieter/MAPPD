// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'todo_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<TodoItem> todoList = [];
  late String nextTodoName;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "TODO List",
            style: TextStyle(fontSize: 48),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          children: todoList,
        ),
        bottomSheet: Card(
          color: Colors.green[700],
          child: TextField(
            style: TextStyle(fontSize: 48, color: Colors.white),
            autofocus: true,
            onChanged: (String userInput) => nextTodoName = userInput,
            onSubmitted: (String userInput) =>
                setState(() => todoList.add(TodoItem(userInput))),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          materialTapTargetSize: MaterialTapTargetSize.padded,
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrange,
          onPressed: addNewItem,
        ),
        backgroundColor: Colors.brown[800],
      ),
    );
  }

  void addNewItem() {
    setState(() => todoList.add(TodoItem(nextTodoName)));
  }
}
