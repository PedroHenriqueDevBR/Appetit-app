import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/models/demand_date.model.dart';
import 'package:maida_coffee_challenge/app/models/food_category.model.dart';

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
    List<DemandDate> demandListWithDate =  [];

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

}