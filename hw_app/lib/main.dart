import "package:flutter/material.dart";
import "dart:math";
import "datapoint.dart";
import "controlpanel.dart";

main() => runApp(DataViewer());

class DataViewer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DataViewerState();
  }
}

class _DataViewerState extends State<DataViewer> {
  int index = 0;
  List<double> _datapoints = [];
  double _currentData = 0.0;

  List<RaisedButton> buttonList = [];

  set _data(num idx) {
    _currentData = _datapoints[idx as int];
    setState(() {
      _currentData = _datapoints[idx];
    });
  }

  double get _data {
    return _currentData;
  }

  @override
  Widget build(BuildContext context) {
    if (buttonList.length < 10) {
      for (int i = 0; i < 10; i++) {
        buttonList.add(RaisedButton(
          onPressed: () => _data = i,
          child: Text(
            "Get data point $i",
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ));
      }
    }
    if (_datapoints.length < 10) {
      for (int i = 0; i < 10; i++) {
        _datapoints.add(Random().nextInt(1000) * Random().nextDouble());
      }
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Important Montecarlo Data!",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        body: Column(
          children: [
            DataPoint(_data),
            ControlPanel(buttonList),
          ],
        ),
      ),
    );
  }
}
