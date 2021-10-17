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
      child: showDetails
          ? //Turnary expression is used to toggle the details panel
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  title: Text("TODO: ${widget.taskName}"),
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
                  title: Text("TODO: ${widget.taskName}"),
                  elevation: 12,
                ),
              ],
            ),
      onPressed: () => setState(() => showDetails = showDetails ? false : true),
    );
  }

  TodoItem todoItem(taskName) => TodoItem(taskName, widget.details);
}
