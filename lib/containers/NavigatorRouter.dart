import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  final text = 'this is NewsListPage';
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: new Text(text),
      ),
    );
  }
}