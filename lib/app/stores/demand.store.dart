import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:mobx/mobx.dart';

part 'demand.store.g.dart';

class DemandStore = _DemandStore with _$DemandStore;

abstract class _DemandStore with Store {

  _DemandStore(this.demand);

  @observable
  Demand demand;

  @observable
  bool paid = true;

  @observable
  String date = '';

  @action
  void togglePaid(value) {
    paid = !paid;
    demand.paid = paid;
  }

  @action
  void setDate(String date) {
    this.date = date;
    demand.date = date;
  }

}