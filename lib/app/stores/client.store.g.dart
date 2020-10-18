// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientStore on _ClientStore, Store {
  final _$selectedAtom = Atom(name: '_ClientStore.selected');

  @override
  bool get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(bool value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  final _$hideAtom = Atom(name: '_ClientStore.hide');

  @override
  bool get hide {
    _$hideAtom.reportRead();
    return super.hide;
  }

  @override
  set hide(bool value) {
    _$hideAtom.reportWrite(value, super.hide, () {
      super.hide = value;
    });
  }

  final _$_ClientStoreActionController = ActionController(name: '_ClientStore');

  @override
  void toggleSelected() {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.toggleSelected');
    try {
      return super.toggleSelected();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHide(bool value) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setHide');
    try {
      return super.setHide(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selected: ${selected},
hide: ${hide}
    ''';
  }
}
