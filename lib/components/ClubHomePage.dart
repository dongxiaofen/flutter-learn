import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../routers/application.dart';

class ClubHomePage extends StatelessWidget {
  final text = '俱乐部页面';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(text),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: const Color(0xFF3A90FF),
        child: new Text('跳转', style: new TextStyle(color: Colors.white),),
        onPressed: () {
          const testData = 'this is test data';
          Application.router.navigateTo(context, '/income?clubId=455&testData=$testData', transition: TransitionType.inFromRight);
          // Application.router.navigateTo(context, '/income', transition: TransitionType.fadeIn);
          // Application.router.navigateTo(context, '/income', transition: TransitionType.native);
        },
      ),
    );
  }
}