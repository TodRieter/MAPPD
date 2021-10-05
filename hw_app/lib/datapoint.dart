import "package:flutter/material.dart";

class DataPoint extends StatelessWidget {
  double value;
  DataPoint(this.value);
  Widget build(BuildContext context) {
    return Text(
      value.toString(),
      style: TextStyle(fontSize: 32),
    );
  }
}
