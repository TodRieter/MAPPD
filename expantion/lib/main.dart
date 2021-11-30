import 'package:flutter/material.dart';

import 'models/thing.dart';

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
  final things = [
    Thing('a', 'title to see', 'third String'),
    Thing('b', 'title to see', 'third String'),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: things.length,
          itemBuilder: (context, index) {
            final item = things[index];
            return ExpansionTile(
              leading: CircleAvatar(
                child: Text(item.first),
              ),
              title: Text(item.second),
              children: [
                Text(item.third),
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
