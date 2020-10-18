import 'package:maida_coffee_challenge/app/models/client.model.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/models/food_demand.model.dart';

class Demand {
  String date;
  bool paid;
  List<FoodDemand> foodList;
  Client client;

  Demand(this.date, this.paid, this.foodList, this.client);

  Demand.creator() {
    this.foodList = [];
  }

  void addFood(FoodDemand food) {
    this.foodList.add(food);
  }

  void removeFood(FoodDemand food) {
    this.foodList.remove(food);
  }

  void paidDemand() {
    this.paid = true;
  }

  copyWith(Client client) {
    return Demand(this.date, this.paid, this.foodList, client);
  }

  double getDemandTotal() {
    double total = 0;
    for (FoodDemand foodDemand in this.foodList) {
      double priceMultipliedByQuantity = foodDemand.getTotalPrice();
      total += priceMultipliedByQuantity;
    }
    return total;
  }

  bool foodAdded(Food foodVerifier) {
    this.foodList.forEach((FoodDemand foodDemand) {
      if (foodDemand.food == foodVerifier) {
        print('Food: ${foodVerifier.name}');
        return true;
      }
    });
    return false;
  }

  String getFoodNamesInLine() {
    String result = '';

    for (int i = 0; i < this.foodList.length; i++) {
      FoodDemand foodDemand = foodList[i];
      if (i == foodList.length - 1) {
        result += '${foodDemand.amount}X ${foodDemand.food.name}';
      } else {
        result += '${foodDemand.amount}X ${foodDemand.food.name}, ';
      }
    }
    return result;
  }
}
