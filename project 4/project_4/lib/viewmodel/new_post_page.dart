import 'package:flutter/widgets.dart';

import "package:flutter/material.dart";
import 'package:project_4/models/envelope.dart';
import 'package:project_4/models/user_data.dart';
import 'package:project_4/services/deta.dart';
import 'package:project_4/viewmodel/posts_page.dart';
import "../models/post.dart";

class NewPostPage extends StatelessWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = UserData.getUsername();
    String tmpTitle = "";
    String tmpAuthor = "";
    String tmpReview = "";
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
          maxLines: null,
          minLines: null,
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
