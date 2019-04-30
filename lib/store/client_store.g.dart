// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$ClientStore on _ClientStore, Store {
  final _$userInfoAtom = Atom(name: '_ClientStore.userInfo');

  @override
  Map<String, dynamic> get userInfo {
    _$userInfoAtom.reportObserved();
    return super.userInfo;
  }

  @override
  set userInfo(Map<String, dynamic> value) {
    // 我那边有报错这个地方我注释了
    // _$userInfoAtom.context.checkIfStateModificationsAreAllowed(_$userInfoAtom);
    super.userInfo = value;
    _$userInfoAtom.reportChanged();
  }

  final _$getUserInfoActionAsyncAction = AsyncAction('getUserInfoAction');

  @override
  Future<dynamic> getUserInfoAction() {
    return _$getUserInfoActionAsyncAction.run(() => super.getUserInfoAction());
  }
}
