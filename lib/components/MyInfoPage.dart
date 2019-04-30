// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_nxj_c/store/client_store.dart';

class MyInfoPage extends StatelessWidget {
  MyInfoPage() {
    clientStore.getUserInfoAction();
  }
  final ClientStore clientStore = new ClientStore();
  final text = '我的';
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Observer(
        builder: (_) => new Text('${clientStore.userInfo.toString()}'),
      ),
    );
  }
}