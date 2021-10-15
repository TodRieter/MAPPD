import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  String? taskName;
  TodoItem(this.taskName);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("TODO: $taskName"),
        shadowColor: Colors.black,
        elevation: 12,
      ),
    );
  }

  TodoItem todoItem(taskName) => TodoItem(this.taskName);
}

// class _TodoItemState extends State<TodoItem> {

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AppBar(
//           centerTitle: false,
//           title: Text("TODO: $taskName"),
//         ),
//       ],
//     );
//   }
// }

// TodoItem todoItem(taskName) => TodoItem(taskName);
