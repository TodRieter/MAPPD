import 'package:flutter/widgets.dart';
import "package:flutter/material.dart";
import 'package:project_4/models/user_data.dart';
import 'package:project_4/services/deta.dart';
import "../models/post.dart";

class NewPostPage extends StatelessWidget {
  final String username;
  final String title;
  final String author;
  final String review;
  const NewPostPage(
      {this.username = "",
      this.title = "",
      this.author = "",
      this.review = "",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = this.username;
    String tmpTitle = title;
    String tmpAuthor = author;
    String tmpReview = review;
    return ListView(
      children: [
        TextFormField(
          initialValue: UserData.getUsername(),
          decoration: const InputDecoration(labelText: "Username"),
          readOnly: true,
          onChanged: (value) {
            username = value;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: "Book Title"),
          onChanged: (value) {
            tmpTitle = value;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: "Author"),
          onChanged: (value) {
            tmpAuthor = value;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: "Book Review"),
          onChanged: (value) {
            tmpReview = value;
          },
        ),
        ElevatedButton(
          onPressed: () {
            DetaService().postPost(
              Post(
                author: tmpAuthor,
                reviewer: username,
                title: tmpTitle,
                body: tmpReview,
                date: DateTime.now().millisecondsSinceEpoch,
                humanTime: DateTime.now().toString(),
              ),
            );
          },
          child: const Text("Post Review"),
        ),
      ],
    );
  }
}
