// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demand_history.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DemandHistoryStore on _DemandHistoryStore, Store {
  final _$demandOnRequestAtom =
      Atom(name: '_DemandHistoryStore.demandOnRequest');

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

  final _$_DemandHistoryStoreActionController =
      ActionController(name: '_DemandHistoryStore');

  @override
  void setDemands() {
    final _$actionInfo = _$_DemandHistoryStoreActionController.startAction(
        name: '_DemandHistoryStore.setDemands');
    try {
      return super.setDemands();
    } finally {
      _$_DemandHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void search(String value) {
    final _$actionInfo = _$_DemandHistoryStoreActionController.startAction(
        name: '_DemandHistoryStore.search');
    try {
      return super.search(value);
    } finally {
      _$_DemandHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
demandOnRequest: ${demandOnRequest}
    ''';
  }
}
