
import 'package:mobx/mobx.dart';
import 'dart:async';
import 'package:flutter_nxj_c/api/client.dart';

part 'client_store.g.dart';

class ClientStore = _ClientStore with _$ClientStore;

abstract class _ClientStore implements Store {
  @observable
  Object userInfo = {};

  @action
  Future getUserInfoAction() async {
    userInfo = await getUserInfo();
    print('this is userInfo: $userInfo');
  }
}