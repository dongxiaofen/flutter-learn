
import 'package:mobx/mobx.dart';
import 'dart:async';
import 'package:flutter_nxj_c/api/client.dart';

part 'client_store.g.dart';

class ClientStore = _ClientStore with _$ClientStore;

abstract class _ClientStore implements Store {
  @observable
  Map<String, dynamic> userInfo = {};

  @observable
  Map<String, dynamic> homePageList = {};
  // @observable
  // List listItems = new List();
  @observable
  Map<String, dynamic> listParams = {
    'page': 10,
    'index': 1
  };
  @observable bool isLoading = false; // 请求数据中
  @observable bool hasMore = true;

  @action
  Future getUserInfoAction() async {
    var data = await getUserInfo();
    userInfo = data;
  }

  @action
  void handlePageChange(int idx) {
    listParams['index'] = idx;
  }

  @action
  Future getHomeList() async {
    if (!isLoading && hasMore) {
      isLoading = true;
      var data = await getHomePageList(listParams);
      homePageList = data;
      isLoading = false;
      hasMore = listParams['page'] * listParams['index'] < data['totalElements'] ? true : false;
    }
  }
}