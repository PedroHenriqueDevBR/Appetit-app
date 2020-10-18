// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demand_information.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DemandInformationStore on _DemandInformationStore, Store {
  Computed<bool> _$foodHasSelectedComputed;

  @override
  bool get foodHasSelected =>
      (_$foodHasSelectedComputed ??= Computed<bool>(() => super.foodHasSelected,
              name: '_DemandInformationStore.foodHasSelected'))
          .value;

  final _$demandOnRequestAtom =
      Atom(name: '_DemandInformationStore.demandOnRequest');

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

  final _$currentFoodAtom = Atom(name: '_DemandInformationStore.currentFood');

  @override
  Food get currentFood {
    _$currentFoodAtom.reportRead();
    return super.currentFood;
  }

  @override
  set currentFood(Food value) {
    _$currentFoodAtom.reportWrite(value, super.currentFood, () {
      super.currentFood = value;
    });
  }

  final _$searchTextAtom = Atom(name: '_DemandInformationStore.searchText');

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$_DemandInformationStoreActionController =
      ActionController(name: '_DemandInformationStore');

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$_DemandInformationStoreActionController.startAction(
        name: '_DemandInformationStore.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_DemandInformationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFood(FoodDemand food) {
    final _$actionInfo = _$_DemandInformationStoreActionController.startAction(
        name: '_DemandInformationStore.addFood');
    try {
      return super.addFood(food);
    } finally {
      _$_DemandInformationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFoodCategories() {
    final _$actionInfo = _$_DemandInformationStoreActionController.startAction(
        name: '_DemandInformationStore.setFoodCategories');
    try {
      return super.setFoodCategories();
    } finally {
      _$_DemandInformationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchFood(String search) {
    final _$actionInfo = _$_DemandInformationStoreActionController.startAction(
        name: '_DemandInformationStore.searchFood');
    try {
      return super.searchFood(search);
    } finally {
      _$_DemandInformationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
demandOnRequest: ${demandOnRequest},
currentFood: ${currentFood},
searchText: ${searchText},
foodHasSelected: ${foodHasSelected}
    ''';
  }
}
