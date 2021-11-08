import "package:flutter/material.dart";

class DataPoint extends StatelessWidget {
  double value;
  DataPoint(this.value);
  Widget build(BuildContext context) {
    return Text(
      value.toString(),
      style: const TextStyle(fontSize: 32),
    );
  }
}
