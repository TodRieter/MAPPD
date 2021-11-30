import "package:flutter/material.dart";
import 'screen_two.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text("Screen one"),
      ElevatedButton(
        child: Text("Screen Two"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ScreenTwo(message: "and now we're on screen two")));
        },
      ),
    ]));
  }
}
