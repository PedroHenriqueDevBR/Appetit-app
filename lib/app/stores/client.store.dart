import 'package:maida_coffee_challenge/app/models/client.model.dart';
import 'package:mobx/mobx.dart';

part 'client.store.g.dart';

class ClientStore = _ClientStore with _$ClientStore;

abstract class _ClientStore with Store {

  _ClientStore(this.client);

  final Client client;

  @observable
  bool selected = false;

  @observable
  bool hide = false;

  @action
  void toggleSelected() => selected = !selected;

  @action
  void setHide(bool value) => hide = value;
}