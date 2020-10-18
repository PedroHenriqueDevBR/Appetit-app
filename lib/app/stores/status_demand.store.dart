import 'package:maida_coffee_challenge/app/models/client.model.dart';
import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/singleton/fake_data.singleton.dart';
import 'package:mobx/mobx.dart';

import 'demand.store.dart';

part 'status_demand.store.g.dart';

class StatusDemandStore = _StatusDemandStore with _$StatusDemandStore;

abstract class _StatusDemandStore with Store {
  @observable
  DemandStore demandStore;

  @observable
  List<Client> clients;

  @action
  void setDemand(Demand demand) {
    demand.paid = false;
    this.demandStore = DemandStore(demand);
  }

  @action
  void setClients(List<Client> clients) => this.clients = clients;

  @action
  void registerDemands() {
    for (Client client in this.clients) {
      Demand demand = this.demandStore.demand.copyWith(client);
      FakeDataSingleton.instance.addDemand(demand);
    }
  }

  @computed
  bool get enableButton => demandStore.demand.date != null && demandStore.paid != null;

}