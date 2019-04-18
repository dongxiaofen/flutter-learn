import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInfoPage extends StatelessWidget {
  final text = 'this is MyInfoPage';
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: new Text(text),
    );
  }
}