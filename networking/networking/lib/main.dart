import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'math_fact.dart';

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
  Future<http.Response> fetchFact() async {
    var headers = {'content-type': 'applicatoin/json'};
    return await http.get(
      Uri.parse('http://numbersapi.com/202/math'),
      headers: headers,
    );
  }

  _MyHomePageState() {
    fetchFact().then(
      (response) {
        MathFact fact = MathFact.fromJson(jsonDecode(response.body));
        setState(() {
          mathFact = fact;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    fetchFact();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              mathFact!.text,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}