import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("AppBar"),
        ),
        body: Row(
          children: [
            Container(
              height: 100,
              color: Colors.blue,
              child: const Text("this name is too long in theory"),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: Container(
                height: 100,
                color: Colors.red,
                child: const Text("Item 2"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                color: Colors.blue,
                child: const Text("Item 3"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
