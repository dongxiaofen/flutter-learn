import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routers/routers.dart';
import 'routers/application.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nxj_c/helpers/constants.dart';

void main() {
  // 修改系统状态栏颜色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color(AppColors.themeColor), // navigation bar color
    statusBarColor: Color(AppColors.themeColor), // status bar color
  ));
  runApp(new MyAppState());
}

// class MyApp extends StatefulWidget {
//   @override
//   State createState() {
//     return new MyAppState();
//   }
// }

class MyAppState extends StatelessWidget {
// class MyAppState extends State<MyApp> {
  MyAppState() {
    final router = new Router();
    Routers.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      initialRoute: '/',
      title: '脑学家',
      theme: new ThemeData(primaryColor: const Color(0xffFFDC2E)),
      onGenerateRoute: Application.router.generator,
    );
    return app;
  }
}
