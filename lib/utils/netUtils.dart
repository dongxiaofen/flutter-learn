import 'dart:async';

import 'package:dio/dio.dart';


var baseUrl = 'http://192.168.0.99:18081';
BaseOptions options = new BaseOptions(
  baseUrl: baseUrl,
  headers: {
    'nxj-id': 'flutter'
  }
  // cookies: 
);
var dio = new Dio(options);
// dio.interceptors..add(CookieManager(CookieJar()))..add(LogInterceptor());
class NetUtils {

  static Future get(String url,{Map<String,dynamic> params}) async{
     var response = await dio.get(url, queryParameters: params);
    // print('headers: ${response.headers}');
    // print('request: ${response.request}');
    // print('statusCode: ${response.statusCode}');
    // print('data: ${response.data}');
    return  response.data;
  }

  static Future post(String url,Map<String,dynamic> params) async{
    var response = await dio.post(url, data: params);
    return response.data;
  }
}