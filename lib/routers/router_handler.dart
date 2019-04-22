import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../pages/Home.dart';
import '../pages/Income.dart';

var rootHandle = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Home();
  },
);

var incomeHandle = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Income();
  },
);