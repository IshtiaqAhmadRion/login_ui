import 'dart:async';
//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonPress extends StatefulWidget {
  @override
  _ButtonPressState createState() => _ButtonPressState();
}

class _ButtonPressState extends State<ButtonPress> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        FutureBuilder(
            future: instantDate(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Text(
                      snapshot.data,
                      style: TextStyle(fontSize: 30),
                    )
                  : CircularProgressIndicator();
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: futureData(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Text(
                        snapshot.data,
                        style: TextStyle(
                            fontSize: 30, decoration: TextDecoration.overline),
                      )
                    : CircularProgressIndicator();
              }),
        )
      ],
    ));
  }
}

//Future Method in instant Data
Future<String> instantDate() async {
  Completer completer = Completer<String>();
  Future<String> futureString;
  String x = "Instant Data";

  completer.complete(x);

  futureString = completer.future;
  return futureString;
}

//Future Method
Future<String> futureData() async {
  String x = "Future Data";
  await Future.delayed(Duration(seconds: 3));

  return x;
}

//Stream Method
