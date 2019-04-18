import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoveryPage extends StatelessWidget {
  final text = 'this is DiscoveryPage';
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: new Text(text),
    );
  }
}