import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/models/food_category.model.dart';
import 'package:maida_coffee_challenge/app/models/food_demand.model.dart';
import 'package:maida_coffee_challenge/app/singleton/fake_data.singleton.dart';
import 'package:mobx/mobx.dart';

part 'demand_information.store.g.dart';

class DemandInformationStore = _DemandInformationStore with _$DemandInformationStore;

abstract class _DemandInformationStore with Store {

  ObservableList<FoodCategory> foods = ObservableList<FoodCategory>();

  @observable
  Demand demandOnRequest = Demand.creator();

  @observable
  Food currentFood;

  @observable
  String searchText = '';

  @action
  void setSearchText(String value) => searchText = value;

  @action
  void addFood(FoodDemand food) {
    demandOnRequest.addFood(food);
  }

  @action
  void setFoodCategories() {
    List<FoodCategory> foodCategories = FakeDataSingleton.instance.user.foodCategoryList;
    for (FoodCategory item in foodCategories) {
      foods.add(item);
    }
  }

  @action
  void searchFood(String search) {
    foods.clear();
    List<FoodCategory> foodCategories = FakeDataSingleton.instance.user.searchFoods(search);
    for (FoodCategory item in foodCategories) {
      foods.add(item);
    }
  }

  @computed
  bool get foodHasSelected {
    for (FoodDemand foodDemand in demandOnRequest.foodList) {
      if (foodDemand.food == currentFood) {
        return true;
      }
    }
    return false;
  }

  void setCurrentFood(Food food) => currentFood = food;

}