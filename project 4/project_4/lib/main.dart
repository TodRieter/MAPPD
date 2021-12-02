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
  // final posts_from_services = DetaService().fetchPost();

  final posts = [
    Post(
      'Jon Jaffari',
      'Who Ever wrote this autobiography clearly never met Jon Jaffari!',
      "Thomas Wilson",
      "The Life of Jon Jaffari (an auto biography in 3 parts)",
      DateTime.now().microsecondsSinceEpoch,
    ),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("posts_from_services: ${DetaService().fetchPost()}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final item = posts[index];
              return ExpansionTile(
                leading: CircleAvatar(
                  child: Text(item.reviewer),
                ),
                title: Text(item.title),
                children: [
                  Text(item.body),
                  ElevatedButton(
                    onPressed: () {
                      DetaService().postPost(item);
                    },
                    child: const Text("Post"),
                  )
                ],
              );
            }),
        // SizedBox(
        //   height: 10,
        //   child: BottomNavigationBar(items: const [
        //     BottomNavigationBarItem(
        //       label: '1',
        //       icon: Icon(Icons.add),
        //     ),
        //     BottomNavigationBarItem(
        //       label: '2',
        //       icon: Icon(Icons.add),
        //     ),
        //     BottomNavigationBarItem(
        //       label: '3',
        //       icon: Icon(Icons.add),
        //     ),
        //   ]),
        // )
      ]),
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
