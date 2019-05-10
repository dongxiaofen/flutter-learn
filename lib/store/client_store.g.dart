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
    _$userInfoAtom.context.checkIfStateModificationsAreAllowed(_$userInfoAtom);
    super.userInfo = value;
    _$userInfoAtom.reportChanged();
  }

  final _$homePageListAtom = Atom(name: '_ClientStore.homePageList');

  @override
  Map<String, dynamic> get homePageList {
    _$homePageListAtom.reportObserved();
    return super.homePageList;
  }

  @override
  set homePageList(Map<String, dynamic> value) {
    _$homePageListAtom.context
        .checkIfStateModificationsAreAllowed(_$homePageListAtom);
    super.homePageList = value;
    _$homePageListAtom.reportChanged();
  }

  final _$listParamsAtom = Atom(name: '_ClientStore.listParams');

  @override
  Map<String, dynamic> get listParams {
    _$listParamsAtom.reportObserved();
    return super.listParams;
  }

  @override
  set listParams(Map<String, dynamic> value) {
    _$listParamsAtom.context
        .checkIfStateModificationsAreAllowed(_$listParamsAtom);
    super.listParams = value;
    _$listParamsAtom.reportChanged();
  }

  final _$isLoadingAtom = Atom(name: '_ClientStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context
        .checkIfStateModificationsAreAllowed(_$isLoadingAtom);
    super.isLoading = value;
    _$isLoadingAtom.reportChanged();
  }

  final _$hasMoreAtom = Atom(name: '_ClientStore.hasMore');

  @override
  bool get hasMore {
    _$hasMoreAtom.reportObserved();
    return super.hasMore;
  }

  @override
  set hasMore(bool value) {
    _$hasMoreAtom.context.checkIfStateModificationsAreAllowed(_$hasMoreAtom);
    super.hasMore = value;
    _$hasMoreAtom.reportChanged();
  }

  final _$getUserInfoActionAsyncAction = AsyncAction('getUserInfoAction');

  @override
  Future<dynamic> getUserInfoAction() {
    return _$getUserInfoActionAsyncAction.run(() => super.getUserInfoAction());
  }

  final _$getHomeListAsyncAction = AsyncAction('getHomeList');

  @override
  Future<dynamic> getHomeList() {
    return _$getHomeListAsyncAction.run(() => super.getHomeList());
  }

  final _$_ClientStoreActionController = ActionController(name: '_ClientStore');

  @override
  void handlePageChange(int idx) {
    final _$actionInfo = _$_ClientStoreActionController.startAction();
    try {
      return super.handlePageChange(idx);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }
}
