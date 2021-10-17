import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  String? taskName;
  String? details;

  TodoItem(this.taskName, this.details);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: showDetails == true
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  title: Text("TODO: ${widget.taskName} tap to hide details"),
                  elevation: 12,
                ),
                Text(
                  "      ${widget.details!}",
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
              ],
            )
          : Column(
              children: [
                AppBar(
                  title: Text("TODO: ${widget.taskName} tap to show details"),
                  elevation: 12,
                ),
              ],
            ),
      onPressed: () => setState(() => showDetails = showDetails ? false : true),
    );
  }

  TodoItem todoItem(taskName) => TodoItem(taskName, widget.details);
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
