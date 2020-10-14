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

      if (demandDate.demandlist.length > 0) {
        demandDate.setTotal(total);
        demandListWithDate.add(demandDate);
      }
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
    if (search.isEmpty) {
      return this.foodCategoryList;
    }

    this.foodCategoryList.forEach((FoodCategory foodCategory) {
      FoodCategory foodResponse = _searchFoodMatch(search, foodCategory);
      if (foodResponse != null) {
        foodCatefories.add(foodResponse);
      }
    });

    return foodCatefories;
  }

  FoodCategory _searchFoodMatch(String search, FoodCategory foodCategory) {
    search = search.toLowerCase();
    FoodCategory foodResponse;
    List<Food> foods = [];

    String foodCategoryName = foodCategory.name.toLowerCase();
    if (foodCategoryName.contains(search)) {
      return foodCategory;
    }

    foodCategory.foodList.forEach((Food food) {
      String foodName = food.name;
      if (foodName.contains(search)) {
        foods.add(food);
      }
    });
    if (foods.length > 0) {
      foodResponse = foodCategory.copyWith();
      foodResponse.foodList = foods;
    }
    return foodResponse;
  }
}
