import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int gen = 20;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flex Testing"),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Expanded(
            flex: 1000000,
            child: Row(
              children: [
                Flexible(
                  flex: 100,
                  fit: FlexFit.loose,
                  child: Column(
                    children: List.generate(
                      gen,
                      (int i) => Flexible(
                        fit: FlexFit.loose,
                        flex: i,
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              flex: i,
                              child: Row(children: [
                                Text(
                                  "loose, felx: $i ",
                                  style: TextStyle(
                                    fontSize: 1 + i / 2,
                                  ),
                                ),
                                Text(
                                  "loose",
                                  style: TextStyle(
                                    fontSize: 1 + i / 2,
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 100,
                  fit: FlexFit.tight,
                  child: Column(
                    children: List.generate(
                      gen,
                      (int i) => Flexible(
                        fit: FlexFit.tight,
                        flex: i,
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              flex: i,
                              child: Row(
                                children: [
                                  Text(
                                    "tight, felx: $i ",
                                    style: TextStyle(
                                      fontSize: 1 + i / 2,
                                    ),
                                  ),
                                  Text(
                                    "tight",
                                    style: TextStyle(
                                      fontSize: 1 + i / 2,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 100,
                  child: Column(
                    children: List.generate(
                      gen,
                      (int i) => Expanded(
                        flex: i,
                        child: Row(
                          children: [
                            Expanded(
                              flex: i,
                              child: Row(
                                children: [
                                  Text(
                                    "Expanded, felx: $i ",
                                    style: TextStyle(
                                      fontSize: 1 + i / 2,
                                    ),
                                  ),
                                  Text(
                                    "Expanded",
                                    style: TextStyle(
                                      fontSize: 1 + i / 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
