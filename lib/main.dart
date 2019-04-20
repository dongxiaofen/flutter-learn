import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/Home.dart';
// import 'pages/Income.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '脑学家',
      home: new Home(),
      // routes: <String, WidgetBuilder> {
      //   '/income': (BuildContext context) => new Income(),
      //   '/home': (BuildContext context) => new Home(),
      // },
    );
  }
}
