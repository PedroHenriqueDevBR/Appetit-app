// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_food.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectedFoodStore on _SelectedFoodStore, Store {
  Computed<double> _$selectTotalPriceComputed;

  @override
  double get selectTotalPrice => (_$selectTotalPriceComputed ??=
          Computed<double>(() => super.selectTotalPrice,
              name: '_SelectedFoodStore.selectTotalPrice'))
      .value;
  Computed<bool> _$isValidSelectedOptionComputed;

  @override
  bool get isValidSelectedOption => (_$isValidSelectedOptionComputed ??=
          Computed<bool>(() => super.isValidSelectedOption,
              name: '_SelectedFoodStore.isValidSelectedOption'))
      .value;

  final _$foodDemandAtom = Atom(name: '_SelectedFoodStore.foodDemand');

  @override
  FoodDemand get foodDemand {
    _$foodDemandAtom.reportRead();
    return super.foodDemand;
  }

  @override
  set foodDemand(FoodDemand value) {
    _$foodDemandAtom.reportWrite(value, super.foodDemand, () {
      super.foodDemand = value;
    });
  }

  final _$selectedOptionAtom = Atom(name: '_SelectedFoodStore.selectedOption');

  @override
  String get selectedOption {
    _$selectedOptionAtom.reportRead();
    return super.selectedOption;
  }

  @override
  set selectedOption(String value) {
    _$selectedOptionAtom.reportWrite(value, super.selectedOption, () {
      super.selectedOption = value;
    });
  }

  final _$amountAtom = Atom(name: '_SelectedFoodStore.amount');

  @override
  int get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(int value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$_SelectedFoodStoreActionController =
      ActionController(name: '_SelectedFoodStore');

  @override
  void setFoodDemand(Food food) {
    final _$actionInfo = _$_SelectedFoodStoreActionController.startAction(
        name: '_SelectedFoodStore.setFoodDemand');
    try {
      return super.setFoodDemand(food);
    } finally {
      _$_SelectedFoodStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAmounnt() {
    final _$actionInfo = _$_SelectedFoodStoreActionController.startAction(
        name: '_SelectedFoodStore.addAmounnt');
    try {
      return super.addAmounnt();
    } finally {
      _$_SelectedFoodStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAmounnt() {
    final _$actionInfo = _$_SelectedFoodStoreActionController.startAction(
        name: '_SelectedFoodStore.removeAmounnt');
    try {
      return super.removeAmounnt();
    } finally {
      _$_SelectedFoodStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedOption(String option) {
    final _$actionInfo = _$_SelectedFoodStoreActionController.startAction(
        name: '_SelectedFoodStore.setSelectedOption');
    try {
      return super.setSelectedOption(option);
    } finally {
      _$_SelectedFoodStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
foodDemand: ${foodDemand},
selectedOption: ${selectedOption},
amount: ${amount},
selectTotalPrice: ${selectTotalPrice},
isValidSelectedOption: ${isValidSelectedOption}
    ''';
  }
}
