// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_demand.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatusDemandStore on _StatusDemandStore, Store {
  Computed<bool> _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_StatusDemandStore.enableButton'))
          .value;

  final _$demandStoreAtom = Atom(name: '_StatusDemandStore.demandStore');

  @override
  DemandStore get demandStore {
    _$demandStoreAtom.reportRead();
    return super.demandStore;
  }

  @override
  set demandStore(DemandStore value) {
    _$demandStoreAtom.reportWrite(value, super.demandStore, () {
      super.demandStore = value;
    });
  }

  final _$clientsAtom = Atom(name: '_StatusDemandStore.clients');

  @override
  List<Client> get clients {
    _$clientsAtom.reportRead();
    return super.clients;
  }

  @override
  set clients(List<Client> value) {
    _$clientsAtom.reportWrite(value, super.clients, () {
      super.clients = value;
    });
  }

  final _$_StatusDemandStoreActionController =
      ActionController(name: '_StatusDemandStore');

  @override
  void setDemand(Demand demand) {
    final _$actionInfo = _$_StatusDemandStoreActionController.startAction(
        name: '_StatusDemandStore.setDemand');
    try {
      return super.setDemand(demand);
    } finally {
      _$_StatusDemandStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClients(List<Client> clients) {
    final _$actionInfo = _$_StatusDemandStoreActionController.startAction(
        name: '_StatusDemandStore.setClients');
    try {
      return super.setClients(clients);
    } finally {
      _$_StatusDemandStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void registerDemands() {
    final _$actionInfo = _$_StatusDemandStoreActionController.startAction(
        name: '_StatusDemandStore.registerDemands');
    try {
      return super.registerDemands();
    } finally {
      _$_StatusDemandStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
demandStore: ${demandStore},
clients: ${clients},
enableButton: ${enableButton}
    ''';
  }
}
