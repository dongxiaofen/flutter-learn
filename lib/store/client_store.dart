
import 'package:mobx/mobx.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_nxj_c/api/client.dart';

part 'client_store.g.dart';

class ClientStore = _ClientStore with _$ClientStore;

abstract class _ClientStore implements Store {
  @observable
  Map<String, dynamic> userInfo = {};

  @action
  Future getUserInfoAction() async {
    var data = await getUserInfo();
    userInfo = data;
    print('this is userInfo: $userInfo');
  }
}