import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  final String message;
  const ScreenTwo({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(message)),
    );
  }
}
