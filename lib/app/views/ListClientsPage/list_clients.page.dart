import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/models/client.model.dart';
import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/stores/client.store.dart';
import 'package:maida_coffee_challenge/app/stores/client_list.store.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/views/CloseDemandPage/close_demand.page.dart';
import 'package:maida_coffee_challenge/app/views/ListClientsPage/client_list.widget.dart';
import 'package:maida_coffee_challenge/app/views/ListClientsPage/forward_button.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/client_list_item.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/header_information.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/search_field.widget.dart';

class ListClientsPage extends StatefulWidget {
  Demand demand;

  ListClientsPage(this.demand);

  @override
  _ListClientsPageState createState() => _ListClientsPageState();
}

class _ListClientsPageState extends State<ListClientsPage> {
  TextEditingController _txtSearch = TextEditingController();
  AppString _string = AppString();
  ClientListStore _clientStore = ClientListStore();

  void _goBack() {
    Navigator.pop(context);
  }

  void _goToCloseDemandPage() {
    List<Client> clients = [];
    Demand demand = _clientStore.demandOnRequest;

    for (ClientStore client in _clientStore.clients) {
      if (client.selected) {
        clients.add(client.client);
      }
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CloseDemandPage(demand, clients),
        ));
  }

  @override
  void initState() {
    _clientStore.setDemandData(widget.demand);
    _clientStore.setClientData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: _goBack),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _headerInformation(),
                  ClientListWidget(_clientStore.getClients),
                ],
              ),
            ),
          ),
          _forwardButton(),
        ],
      ),
    );
  }

  Widget _headerInformation() {
    return HeaderInformationWidget(
      2,
      _string.whichClient,
      child: SearchField(_txtSearch, _clientStore.searchClient),
    );
  }

  Widget _forwardButton() {
    return Observer(
        builder: (_) {
          int amount = _clientStore.totalSelectedClients;
          return _clientStore.enableButton
              ? ForwardButtonWidget(
            amount,
            _goToCloseDemandPage,
          )
              : Container();
        }
    );
  }
}
