import 'package:maida_coffee_challenge/app/models/demand.model.dart';

class DemandDate {
  String date;
  List<Demand> demandlist;
  double total = 0;

  DemandDate(this.date);

  void addDemand(Demand demand) {
    this.demandlist.add(demand);
  }

  void setTotal(double total) {
    this.total = total;
  }
}