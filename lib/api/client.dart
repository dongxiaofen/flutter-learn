import '../utils/netUtils.dart';

dynamic getUserInfo() {
  var respones = NetUtils.get('/api/user/info');
  return respones;
}

dynamic getHomePageList(Map<String, dynamic> params) {
  var respones = NetUtils.get('/api/recommend', params: params);
  return respones;
}