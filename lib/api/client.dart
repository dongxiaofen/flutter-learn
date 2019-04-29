import '../utils/netUtils.dart';

dynamic getUserInfo() {
  var respones = NetUtils.get('/api/businessUser/info');
  return respones;
}