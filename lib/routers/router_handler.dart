import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../pages/Home.dart';
import '../pages/Income.dart';

// 首页
var rootHandle = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Home();
  },
);
// 收入记录
var incomeHandle = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('this is router params: $params');
    String clubId = params['clubId']?.first;
    String testData = params['testData']?.first;
    return new Income(clubId, testData);
  },
);