import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routers/routers.dart';
import 'routers/application.dart';
import 'dart:async';

import 'api/client.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  MyAppState() {
    final router = new Router();
    Routers.configureRoutes(router);
    Application.router = router;
    userInfoApi();
  }
  var userInfo;
  Future userInfoApi() async {
    var data = await getUserInfo();
    setState(() {
      userInfo = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      initialRoute: '/',
      title: '脑学家',
      theme: new ThemeData(
        primaryColor: const Color(0xffFFDC2E)
      ),
      onGenerateRoute: Application.router.generator,
    );
    return app;
  }
}
