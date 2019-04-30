import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Income extends StatelessWidget {
  final clubId;
  final testData;
  Income(this.clubId, this.testData);
  final text = 'this is Income, test';
  @override
  Widget build(BuildContext context) {
    print('clubid: $clubId, testdata: $testData');
    return new Scaffold(
      body: new Center(
        child: new Text(text),
      ),
    );
  }
}