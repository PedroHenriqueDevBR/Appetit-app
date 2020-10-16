import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/models/food_demand.model.dart';
import 'package:mobx/mobx.dart';

part 'selected_food.store.g.dart';

class SelectedFoodStore = _SelectedFoodStore with _$SelectedFoodStore;

abstract class _SelectedFoodStore with Store {
  @observable
  FoodDemand foodDemand;

  @observable
  String selectedOption = '';

  @observable
  int amount = 1;

  @action
  void setFoodDemand(Food food) => foodDemand = FoodDemand.creator(food);

  @action
  void addAmounnt() {
    foodDemand.amount++;
    amount++;
  }

  @action
  void removeAmounnt() {
    if (amount > 1) {
      foodDemand.amount--;
      amount--;
    }
  }

  @action
  void setSelectedOption(String option) {
    foodDemand.selectedOption = option;
    selectedOption = option;
  }

  @computed
  double get selectTotalPrice => foodDemand.food.price * amount;
}