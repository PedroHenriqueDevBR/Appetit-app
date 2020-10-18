import 'package:flutter/cupertino.dart';
import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/models/demand_date.model.dart';
import 'package:maida_coffee_challenge/app/models/food_category.model.dart';
import 'package:maida_coffee_challenge/app/models/user.model.dart';
import 'package:maida_coffee_challenge/app/routes.dart';
import 'package:maida_coffee_challenge/app/singleton/fake_data.singleton.dart';
import 'package:mobx/mobx.dart';

part 'demand_history.store.g.dart';

class DemandHistoryStore = _DemandHistoryStore with _$DemandHistoryStore;

abstract class _DemandHistoryStore with Store {
  ObservableList<DemandDate> demandsWithDate = ObservableList<DemandDate>();

  @observable
  Demand demandOnRequest = Demand.creator();

  @observable
  User user;

  @action
  void setDemands() {
    List<DemandDate> demandsDate = FakeDataSingleton.instance.user.getAllDemands();
    for (DemandDate demandDateItem in demandsDate) {
      demandsWithDate.add(demandDateItem);
    }
  }

  @action
  void setUser() {
    this.user = FakeDataSingleton.instance.user;
  }

  @action
  void search(String value) {
    List demandsDate = [];
    if (value.isEmpty) {
      demandsDate = FakeDataSingleton.instance.user.getAllDemands();
    } else {
      demandsDate = FakeDataSingleton.instance.user.searchDemands(value);
    }
    demandsWithDate.clear();
    for (DemandDate demandDateItem in demandsDate) {
      demandsWithDate.add(demandDateItem);
    }
  }

  void goTocreateDemandPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.DEMAND_INFORMATION_ROUTE);
  }
}
