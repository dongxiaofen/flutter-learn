import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './router_handler.dart';

class Routers {
  static String root = '/';
  static String income = '/income';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {}
    );
    router.define(root, handler: rootHandle);
    router.define(income, handler: incomeHandle);
  }
}