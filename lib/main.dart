// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routers/routers.dart';
import 'routers/application.dart';

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
  }
  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      title: '脑学家',
      theme: new ThemeData(
        primaryColor: const Color(0xff3A90FF)
      ),
      onGenerateRoute: Application.router.generator,
    );
    print('initial Application.router = ${Application.router.generator}');
    return app;
  }
}
