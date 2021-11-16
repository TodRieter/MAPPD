import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'math_fact.dart';
import 'place_kitten.dart';

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
  MathFact mathFact;
  PlaceKitten kitten;
  _MyHomePageState({
    this.mathFact = const MathFact(),
    this.kitten = const PlaceKitten(imageUri: "http://placekitten.com/300/300"),
  });

  Future<http.Response> fetchFact() async {
    var headers = {'content-type': 'application/json'};
    int num = Random().nextInt(100000);
    return await http.get(
      Uri.parse('http://numbersapi.com/$num'),
      headers: headers,
    );
  }

  Future<http.Response> fetchFactFromNum(int num) async {
    var headers = {'content-type': 'application/json'};
    return await http.get(
      Uri.parse('http://numbersapi.com/$num'),
      headers: headers,
    );
  }

  Future<http.Response> fetchKitten() async {
    var headers = {'content-type': 'Image.json'};
    int num = 300;
    return await http.get(
      Uri.parse('http://placekitten.com/$num/$num'),
      headers: headers,
    );
  }


  @override
  Widget build(BuildContext context) {
    fetchFact();
    fetchKitten();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              mathFact.text,
            ),
            Image.network(kitten.imageUri),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchFactFromNum(_counter++).then(
            (response) {
              MathFact fact = MathFact.fromJson(jsonDecode(response.body));

              setState(
                () {
                  mathFact = fact;
                },
              );
            },
          );

          setState(() {
            kitten = PlaceKitten(
                imageUri:
                    "http://placekitten.com/${100 + _counter}/${100 + _counter}");
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
