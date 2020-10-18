import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/models/client.model.dart';
import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/stores/client.store.dart';
import 'package:maida_coffee_challenge/app/stores/client_list.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/views/CloseDemandPage/close_demand.page.dart';
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
  AppColor _color = AppColor();
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
          builder: (_) =>
              CloseDemandPage(demand, clients),
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
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _headerInformations(),
                _clientListContainer(),
              ],
            ),
          ),
        ),
        Observer(
          builder: (_) => _forwardButton(),
        ),
      ],
    );
  }

  Widget _headerInformations() {
    return HeaderInformationWidget(
      2,
      _string.whichClient,
      child: SearchField(_txtSearch, _clientStore.searchClient),
    );
  }

  Widget _clientListContainer() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _string.myClients,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 16),
          _clientList(),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _clientList() {
    return Container(
      child: Observer(
        builder: (_) => ListView.builder(
          itemCount: _clientStore.clients.length,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            ClientStore client = _clientStore.clients[index];
            return Column(
              children: [
                Observer(
                  builder: (_) => ClientListItem(
                    client.client,
                    selected: client.selected,
                    hide: client.hide,
                    action: client.toggleSelected,
                  ),
                ),
                SizedBox(height: 8),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _forwardButton() {
    if (_clientStore.enableButton) {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(16),
          color: _color.primaryColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _clientStore.totalSelectedClients == 1
                    ? '${_clientStore.totalSelectedClients} ${_string.oneSelectedClient}'
                    : '${_clientStore.totalSelectedClients} ${_string.manySelectedClients}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${_string.goForward}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: _goToCloseDemandPage,
      );
    } else {
      return Container();
    }
  }
}
