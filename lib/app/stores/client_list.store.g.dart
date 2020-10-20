// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_list.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientListStore on _ClientListStore, Store {
  Computed<bool> _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_ClientListStore.enableButton'))
          .value;
  Computed<int> _$totalSelectedClientsComputed;

  @override
  int get totalSelectedClients => (_$totalSelectedClientsComputed ??=
          Computed<int>(() => super.totalSelectedClients,
              name: '_ClientListStore.totalSelectedClients'))
      .value;
  Computed<List<ClientStore>> _$getClientsComputed;

  @override
  List<ClientStore> get getClients => (_$getClientsComputed ??=
          Computed<List<ClientStore>>(() => super.getClients,
              name: '_ClientListStore.getClients'))
      .value;

  final _$demandOnRequestAtom = Atom(name: '_ClientListStore.demandOnRequest');

  @override
  Demand get demandOnRequest {
    _$demandOnRequestAtom.reportRead();
    return super.demandOnRequest;
  }

  @override
  set demandOnRequest(Demand value) {
    _$demandOnRequestAtom.reportWrite(value, super.demandOnRequest, () {
      super.demandOnRequest = value;
    });
  }

  final _$_ClientListStoreActionController =
      ActionController(name: '_ClientListStore');

  @override
  void setDemandData(Demand demand) {
    final _$actionInfo = _$_ClientListStoreActionController.startAction(
        name: '_ClientListStore.setDemandData');
    try {
      return super.setDemandData(demand);
    } finally {
      _$_ClientListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClientData() {
    final _$actionInfo = _$_ClientListStoreActionController.startAction(
        name: '_ClientListStore.setClientData');
    try {
      return super.setClientData();
    } finally {
      _$_ClientListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchClient(String keyword) {
    final _$actionInfo = _$_ClientListStoreActionController.startAction(
        name: '_ClientListStore.searchClient');
    try {
      return super.searchClient(keyword);
    } finally {
      _$_ClientListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
demandOnRequest: ${demandOnRequest},
enableButton: ${enableButton},
totalSelectedClients: ${totalSelectedClients},
getClients: ${getClients}
    ''';
  }
}
