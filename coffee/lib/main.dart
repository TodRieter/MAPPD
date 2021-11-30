import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Coffee {
  int id;
  int uid;
  String blendName;
  String notes;

  Coffee({
    required this.id,
    required this.uid,
    required this.blendName,
    required this.notes,
  });
  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json['id'] ?? -1,
      uid: json['uid'] ?? -1,
      notes: json['notes'] ?? "Notes",
      blendName: json['blendName'] ?? 'blendName',
    );
  }
}

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final url = 'https://random-data-api.com/api/coffee/ramdom_coffee?size=10';
  List<Coffee> coffeeList = [];
  _MyHomePageState() {
    _fetchCoffee();
  }
  _fetchCoffee() async {
    final uri = Uri.parse(url);
    final headers = {'content-type': 'application/json'};
    await http.get(uri, headers: headers).then((response) {
      final jsonText = response.body;
      final jsonData = jsonDecode(jsonText);
      final json = jsonData as List<dynamic>;

      if (json != null) {
        final mapped = json.map((e) {
          return Coffee.fromJson(e as Map<String, dynamic>);
        }).toList();

        setState(() {
          coffeeList = mapped as List<Coffee>;
        });
        debugPrint('$mapped');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/80'),
            ),
            title: Text(coffeeList[index].blendName),
            subtitle: Text(
              coffeeList[index].notes,
            ),
          );
        },
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
