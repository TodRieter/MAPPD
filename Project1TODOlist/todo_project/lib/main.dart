// ignore_for_file: prefer_const_constructors

import 'dart:html';

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
  String? taskName;
  late String nextTodoName;
  late String nextTodoDetails;
  @override
  Widget build(BuildContext context) {
    ThemeData darkTheme = ThemeData(
      colorScheme: ThemeData.dark().colorScheme,
      cardColor: ThemeData.dark().colorScheme.primary,
    );
    return MaterialApp(
      theme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "TODO List",
            style: TextStyle(
              fontSize: 48,
            ),
          ),
        ),
        body: ListView(
          children: [
            Text(
              "Tip: Tap on a task to show/hide details",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: todoList,
            ),
          ],
        ),
        bottomSheet: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: darkTheme.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Input task name below:",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextField(
                    style: TextStyle(fontSize: 36),
                    autofocus: true,
                    onChanged: (String userInput) => nextTodoName = userInput,
                  ),
                  Text(
                    "Input task details below:",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextField(
                    style: TextStyle(fontSize: 36),
                    autofocus: false,
                    onChanged: (String userInput) =>
                        nextTodoDetails = userInput,
                  ),
                ],
              ),
            ),
            TextButton(
              child: Text(
                "Add New TODO",
                style: TextStyle(
                    fontSize: 48,
                    color: darkTheme.colorScheme.background,
                    backgroundColor: Colors.teal[300]),
              ),
              onPressed: addNewItem,
            ),
          ],
        ),
      ),
    );
  }

  void addNewItem() {
    setState(() => todoList.insert(0, TodoItem(nextTodoName, nextTodoDetails)));
  }
}
