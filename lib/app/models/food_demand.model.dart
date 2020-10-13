import 'package:maida_coffee_challenge/app/models/food.model.dart';

class FoodDemand {
  Food food;
  int amount;
  String observations;
  String selectedOption;

  FoodDemand(this.food, this.amount, this.observations, this.selectedOption);

  double getTotalPrice(){
    double price = food.price;
    return price * amount;
  }

  void selectOption(String option) {
    this.selectedOption = option;
  }
}