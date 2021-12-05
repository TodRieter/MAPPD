import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_4/models/post.dart';
import 'package:project_4/models/user_data.dart';
import 'package:project_4/services/deta.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatefulWidget {
  // final posts = [
  //   Post(
  //     author: 'Jon Jaffari',
  //     body: 'Who Ever wrote this autobiography clearly never met Jon Jaffari!',
  //     reviewer: "Thomas Wilson",
  //     title: "The Life of Jon Jaffari (an auto biography in 3 parts)",
  //     date: DateTime.now().microsecondsSinceEpoch.toString(),
  //     humanTime: DateTime.now().toString(),
  //     key: '0',
  //   ),
  //   Post(
  //     author: 'Jon',
  //     body: 'Who',
  //     reviewer: "Thomas",
  //     title: "The",
  //     date: DateTime.now().microsecondsSinceEpoch.toString(),
  //     humanTime: DateTime.now().toString(),
  //     key: "1",
  //   ),
  // ];

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Post> posts = [];
  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final item = posts[index];
                return item.reviewer.contains("Russell") &&
                        UserData.getFilterRussellPosts()
                    ? Row()
                    : ExpansionTile(
                        initiallyExpanded: UserData.getExpandByDefault(),
                        leading: CircleAvatar(
                          child: Text(item.reviewer),
                        ),
                        title: Text(item.title),
                        children: [
                          Text(item.body),
                          UserData.getUsername() == item.reviewer
                              ? Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        DetaService().delete(item);
                                        fetchPosts();
                                      },
                                      child: const Text("Delete Post"),
                                    ),
                                  ],
                                )
                              : Row(children: const [Text("\n")]),
                        ],
                      );
              }),
        ),
      ],
    );
  }

  void fetchPosts() async {
    String id = DetaService().id;
    String key = DetaService().key;
    try {
      String url = "https://database.deta.sh/v1/$id/posts/query";
      // String url = "https://database.deta.sh/v1/b0nwc6hd/tldr/query";
      Uri uri = Uri.parse(url);
      final response = await http.post(uri, headers: {'X-API-Key': key});
      final jsonData = jsonDecode(response.body);
      List items = jsonData["items"] as List;
      setState(() {
        posts = [];
      });
      for (Map<String, dynamic> item in items) {
        Post p = Post.fromJson(item);
        setState(() {
          posts.add(p);
        });
      }
    } catch (err) {
      print(err);
    }
  }

  void fetchTLDRPosts() async {
    String id = DetaService().id;
    String tldrKey = 'b0nwc6hd_tWSS1TeWchacsya99DTFe8hPPVxNq1HA';
    try {
      String url = "https://database.deta.sh/v1/$id/posts/query";
      // String url = "https://database.deta.sh/v1/b0nwc6hd/tldr/query";
      Uri uri = Uri.parse(url);
      final response = await http.post(uri, headers: {'X-API-Key': tldrKey});
      final jsonData = jsonDecode(response.body);
      List items = jsonData["items"] as List;
      setState(() {
        posts = [];
      });
      for (Map<String, dynamic> item in items) {
        Post p = Post.fromJson(item);
        setState(() {
          posts.add(p);
        });
      }
    } catch (err) {
      print(err);
    }
  }
}
