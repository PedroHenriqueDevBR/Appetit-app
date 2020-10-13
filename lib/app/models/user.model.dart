import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/models/demand_date.model.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/models/food_category.model.dart';
import 'package:maida_coffee_challenge/app/models/food_demand.model.dart';

class User {
  String name;
  String email;
  String password;
  List<FoodCategory> foodCategoryList;
  List<Demand> demandList;

  User(this.name, this.email, this.password, this.foodCategoryList, this.demandList);

  List<String> _getAllDatesFromDemands() {
    List<String> dates = [];

    for (Demand demand in this.demandList) {
      String demandDate = demand.date;
      if (dates.indexOf(demandDate) < 0) {
        dates.add(demandDate);
      }
    }

    return dates;
  }

  List<DemandDate> getAllDemands() {
    List<String> dates = this._getAllDatesFromDemands();
    List<DemandDate> demandListWithDate = [];

    for (String date in dates) {
      DemandDate demandDate = DemandDate(date);
      double total = 0;

      this.demandList.forEach((demand) {
        if (date == demand.date) {
          demandDate.addDemand(demand);
          total += demand.getDemandTotal();
        }
      });

      demandDate.setTotal(total);
      demandListWithDate.add(demandDate);
    }
    return demandListWithDate;
  }

  List<DemandDate> searchDemands(String search) {
    List<String> dates = this._getAllDatesFromDemands();
    List<DemandDate> demandListWithDate = [];

    for (String date in dates) {
      DemandDate demandDate = DemandDate(date);
      double total = 0;
      this.demandList.forEach((demand) {
        if (_searchDemandMatch(search, demand, date)) {
          demandDate.addDemand(demand);
          total += demand.getDemandTotal();
        }
      });

      demandDate.setTotal(total);
      demandListWithDate.add(demandDate);
    }
    return demandListWithDate;
  }

  bool _searchDemandMatch(String search, Demand demand, String date) {
    search = search.toLowerCase();
    String clientName = demand.client.name.toLowerCase();
    bool find = false;

    if (date != demand.date) {
      return false;
    }
    if (clientName.contains(search)) {
      find = true;
    }
    demand.foodList.forEach((FoodDemand foodDemand) {
      String foodName = foodDemand.food.name.toLowerCase();
      if (foodName.contains(search)) {
        find = true;
      }
    });
    return find;
  }

  List<FoodCategory> searchFoods(String search) {
    List<FoodCategory> foodCatefories = [];

    this.foodCategoryList.forEach((FoodCategory foodCategory) {
      if (_searchFoodMatch(search, foodCategory)) {
        foodCatefories.add(foodCategory);
      }
    });

    return foodCatefories;
  }

  bool _searchFoodMatch(String search, FoodCategory foodCategory) {
    search = search.toLowerCase();
    String foodCategoryName = foodCategory.name.toLowerCase();
    bool find = false;

    if (foodCategoryName.contains(search)) {
      find = true;
    }
    foodCategory.foodList.forEach((Food food) {
      String foodName = food.name;
      if (foodName.contains(search)){
        find = true;
      }
    });
    return find;
  }
}
