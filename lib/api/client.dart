// import 'dart:async';
// import 'package:dio/dio.dart';
import '../utils/netUtils.dart';

// var dio = new Dio();

// class ClientApi {
//   // static var getUserInfo = NetUtils.get('/api/businessUser/info');
//   dynamic getUserInfo() async {
//     var respones = await NetUtils.get('/api/businessUser/info');
//     return respones;
//   }
// }

dynamic getUserInfo() async {
  var respones = await NetUtils.get('/api/businessUser/info');
  print('this is respones: $respones');
  return respones;
}