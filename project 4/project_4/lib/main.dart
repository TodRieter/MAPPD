import 'package:flutter/material.dart';
import 'services/deta.dart';
import 'models/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final posts_from_services = DetaService().fetchPost();

  final posts = [
    Post(
      'a',
      'username 1',
      "sample review",
    ),
    Post(
      'b',
      'username 2',
      "sample review 2",
    ),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("posts_from_services: ${DetaService().fetchPost()}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final item = posts[index];
            return ExpansionTile(
              leading: CircleAvatar(
                child: Text(item.avatar),
              ),
              title: Text(item.username),
              children: [
                Text(item.textField),
                ElevatedButton(
                  onPressed: () {
                    DetaService().postPost(item);
                  },
                  child: const Text("Post"),
                )
              ],
            );
          }),
    );
    // ),
    // floatingActionButton: FloatingActionButton(
    //   onPressed: _incrementCounter,
    //   tooltip: 'Increment',
    //   child: const Icon(Icons.add),
    // ), //This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}
