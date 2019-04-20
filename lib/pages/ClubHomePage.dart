import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClubHomePage extends StatelessWidget {
  final text = '俱乐部页面';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(text),
      ),
      // floatingActionButton: new FloatingActionButton(
      //   backgroundColor: const Color(0xFF3A90FF),
      //   child: new Text('跳转', style: new TextStyle(color: Colors.white),),
      //   onPressed: () {
      //     Navigator.of(context).pushNamed('/income');
      //   },
      // ),
    );
  }
}