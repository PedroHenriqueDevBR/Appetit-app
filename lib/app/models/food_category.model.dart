import 'package:maida_coffee_challenge/app/models/food.model.dart';

class FoodCategory {
  String name;
  List<Food> foodList;

  FoodCategory(this.name, this.foodList);

  void addFood(Food food) {
    this.foodList.add(food);
  }

  List<Food> getAllFoods() {
    return this.foodList;
  }

}