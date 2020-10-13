import 'package:maida_coffee_challenge/app/models/demand.model.dart';

class DemandDate {
  String date;
  List<Demand> demandlist = [];
  double total = 0;

  DemandDate(this.date);

  void addDemand(Demand demand) {
    if (demand == null) {
      print('Demand recebido: ${demand}');
    } else {
      this.demandlist.add(demand);
    }
  }

  void setTotal(double total) {
    this.total = total;
  }

  String getSmallDate() {
    String day = date.split('/')[0];
    String month = date.split('/')[1];
    return '${day}/${month}';
  }
}