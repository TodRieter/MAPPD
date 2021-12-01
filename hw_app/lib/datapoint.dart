import "package:flutter/material.dart";

class DataPoint extends StatelessWidget {
  final double value;
  const DataPoint(
    this.value, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      value.toString(),
      style: const TextStyle(fontSize: 32),
    );
  }
}
