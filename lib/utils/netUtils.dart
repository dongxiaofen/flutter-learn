import 'dart:async';

import 'package:dio/dio.dart';


var dio = new Dio();
var baseUrl = 'http://192.168.0.99:18081';

class NetUtils {
  
  static Future get(String url,{Map<String,dynamic> params}) async{
     var response = await dio.get(baseUrl + url, queryParameters: params);
    return  response.data;
  }

  static Future post(String url,Map<String,dynamic> params) async{
    var response = await dio.post(baseUrl + url, data: params);
    return response.data;
  }
}