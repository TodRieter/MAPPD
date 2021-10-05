import "package:flutter/material.dart";

class ControlPanel extends StatelessWidget {
  List<RaisedButton> panel;
  ControlPanel(this.panel);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: panel,
      ),
    );
  }
}
