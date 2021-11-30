import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
      title: 'Number Facts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Number Facts'),
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
  MathFact mathFact = MathFact(found: false, text: '', type: '', number: 0);

  Future<http.Response> fetchFact() async {
    var headers = {'content-type': 'application/json'};
    return await http.get(
      Uri.parse('http://numbersapi.com/0/math'),
      headers: headers,
    );
  }

  _MyHomePageState() {
    fetchFact().then((response) {
      MathFact fact = MathFact.fromJson(jsonDecode(response.body));
      setState(() {
        mathFact = fact;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  mathFact.text,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
                onPressed: () =>
                    fetchFactFromNumber(mathFact.number + 1).then((response) {
                      MathFact fact =
                          MathFact.fromJson(jsonDecode(response.body));
                      setState(() {
                        mathFact = fact;
                      });
                    })),
          ),
        ],
      ),
    );
  }

  fetchFactFromNumber(int i) async {
    var headers = {'content-type': 'application/json'};
    return await http.get(
      Uri.parse('http://numbersapi.com/$i/math'),
      headers: headers,
    );
  }
}
