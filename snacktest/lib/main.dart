// ignore_for_file: use_key_in_widget_constructors

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
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class TabInfo extends StatelessWidget {
  final Text name;
  const TabInfo(Tab tab, this.name);

  @override
  Widget build(BuildContext context) {
    return name;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> tabInfos = [
    TabInfo(
      const Tab(
        icon: Icon(Icons.access_alarms),
        text: 'A',
      ),
      Text('Screen A'),
    ),
    TabInfo(
      const Tab(
        icon: Icon(Icons.bakery_dining),
        text: 'B',
      ),
      Text('Screen B'),
    ),
    TabInfo(
      const Tab(
        icon: Icon(Icons.cell_wifi),
        text: 'C',
      ),
      Text('Screen C'),
    ),
    TabInfo(
      const Tab(
        icon: Icon(Icons.deck),
        text: 'D',
      ),
      Text('Screen D'),
    ),
  ];
  void _showSnackbar() {
    const snackBar = SnackBar(
      content: Text(
        "it's a bit early for a snack!",
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabInfos.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).backgroundColor,
          child: TabBar(
            tabs: tabInfos
                .map(
                  (e) => e.tab,
                )
                .toList(),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('I want a snack'),
            TabBarView(
              children: [
                Text("A"),
                Text("B"),
                Text("C"),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showSnackbar(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
