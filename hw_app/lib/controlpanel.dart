// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";

class ControlPanel extends StatelessWidget {
  final List<RaisedButton> panel;
  const ControlPanel(this.panel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: panel,
      ),
    );
  }
}
