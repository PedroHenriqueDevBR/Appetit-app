import 'package:flutter/foundation.dart';
import 'package:maida_coffee_challenge/app/models/client.model.dart';
import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/singleton/fake_data.singleton.dart';
import 'package:maida_coffee_challenge/app/stores/client.store.dart';
import 'package:mobx/mobx.dart';

part 'client_list.store.g.dart';

class ClientListStore = _ClientListStore with _$ClientListStore;

abstract class _ClientListStore with Store {
  ObservableList<ClientStore> clients = ObservableList<ClientStore>();

  @observable
  Demand demandOnRequest;

  @action
  void setDemandData(Demand demand) {
    demandOnRequest = demand;
  }

  @action
  void setClientData() {
    List<Client> clientList = FakeDataSingleton.instance.clients;
    for (Client client in clientList) {
      ClientStore clientStore = ClientStore(client);
      clients.add(clientStore);
    }
  }

  @action
  void searchClient(String keyword) {
    keyword = keyword.toLowerCase();
    for (ClientStore clientStore in clients) {
      bool hasMatch = clientStore.client.name.toLowerCase().contains(keyword);
      clientStore.setHide(!hasMatch);
    }
  }

  @computed
  bool get enableButton {
    return totalSelectedClients > 0;
  }

  @computed
  int get totalSelectedClients {
    int total = 0;
    for (ClientStore clientStore in clients) {
      if (clientStore.selected){
        total += 1;
      }
    }
    return total;
  }

  @computed
  List<ClientStore> get getClients => this.clients;

}