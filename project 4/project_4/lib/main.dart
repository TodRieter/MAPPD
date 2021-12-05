import 'package:flutter/material.dart';
import 'package:project_4/viewmodel/new_post_page.dart';
import 'package:project_4/viewmodel/posts_page.dart';
import 'models/user_data.dart';

import 'viewmodel/user_data_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TLDR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TLDR'),
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
  Widget? screen;
  List<Widget> screens = [
    PostsPage(),
    const NewPostPage(),
    UserDataPage(UserData()),
  ];

  void setScreen(int? index, Widget? screen) {
    setState(() {
      if (index != null) {
        this.screen = screens[index];
        return;
      }
      if (screen != null) {
        this.screen = screen;
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      PostsPage(),
      const NewPostPage(),
      UserDataPage(UserData()),
    ];
    screen ??= screens[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              screen = screens[index];
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: '1',
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: '2',
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: '3',
              icon: Icon(Icons.add),
            ),
          ]),
      body: screen,
    );
  }
}
