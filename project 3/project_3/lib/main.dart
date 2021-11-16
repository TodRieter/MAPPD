import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'post.dart';

void main() {
  runApp(const MyApp());
}

Future<http.Response> fetchPost() async {
  var headers = {'content-type': 'Image.json'};
  int id = Random().nextInt(99) + 1;
  return await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
    headers: headers,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Meow-book'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Card> _posts = [];
  Map<int, CircleAvatar> userAvatar = {};
  _MyHomePageState();

  @override
  void initState() {
    for (int i = 0; i < 99; i++) {
      userAvatar[i] = CircleAvatar(
        backgroundImage:
            NetworkImage("HTTPS://placekitten.com/${50 * i}/${50 * i}"),
      );
    }

    super.initState();
  }

  void addNewAvatar(int id, CircleAvatar avatar) {
    userAvatar[id] = avatar;
  }

  CircleAvatar getAvatarFromId(int id) {
    return CircleAvatar(
      backgroundImage:
          NetworkImage("HTTPS://placekitten.com/${50 * id}/${50 * id}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          addAutomaticKeepAlives: false,
          itemBuilder: (context, index) {
            fetchPost().then((response) {
              Post temp = Post.fromJson(jsonDecode(response.body));
              !userAvatar.containsKey(temp.userId)
                  ? addNewAvatar(temp.userId, getAvatarFromId(temp.userId))
                  : DoNothingAction();
              setState(() {
                _posts.add(Card(
                  color: Colors.blueGrey,
                  child: ListTile(
                    leading: userAvatar[temp.userId],
                    title: Text(temp.title),
                    trailing: Text("${temp.userId}"),
                  ),
                ));
              });
            });
            return index >= _posts.length
                ? const Card(
                    color: Colors.blueGrey,
                    child: ListTile(
                      leading: CircularProgressIndicator(),
                      title: Text(""),
                      subtitle: LinearProgressIndicator(),
                      trailing: Text(""),
                    ),
                  )
                : _posts[index];
          },
        ),
      ),
    );
  }
}
