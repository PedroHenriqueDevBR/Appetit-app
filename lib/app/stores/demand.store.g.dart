// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demand.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DemandStore on _DemandStore, Store {
  final _$demandAtom = Atom(name: '_DemandStore.demand');

  @override
  Demand get demand {
    _$demandAtom.reportRead();
    return super.demand;
  }

  @override
  set demand(Demand value) {
    _$demandAtom.reportWrite(value, super.demand, () {
      super.demand = value;
    });
  }

  final _$paidAtom = Atom(name: '_DemandStore.paid');

  @override
  bool get paid {
    _$paidAtom.reportRead();
    return super.paid;
  }

  @override
  set paid(bool value) {
    _$paidAtom.reportWrite(value, super.paid, () {
      super.paid = value;
    });
  }

  final _$dateAtom = Atom(name: '_DemandStore.date');

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$_DemandStoreActionController = ActionController(name: '_DemandStore');

  @override
  void togglePaid(dynamic value) {
    final _$actionInfo = _$_DemandStoreActionController.startAction(
        name: '_DemandStore.togglePaid');
    try {
      return super.togglePaid(value);
    } finally {
      _$_DemandStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(String date) {
    final _$actionInfo = _$_DemandStoreActionController.startAction(
        name: '_DemandStore.setDate');
    try {
      return super.setDate(date);
    } finally {
      _$_DemandStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
demand: ${demand},
paid: ${paid},
date: ${date}
    ''';
  }
}
