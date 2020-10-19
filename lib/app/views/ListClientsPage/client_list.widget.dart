import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/stores/client.store.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/widgets/client_list_item.widget.dart';

class ClientListWidget extends StatelessWidget {
  AppString _string = AppString();
  List<ClientStore> clients;

  ClientListWidget(this.clients);

  @override
  Widget build(BuildContext context) {
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
      child: ListView.builder(
        itemCount: clients.length,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          ClientStore client = clients[index];
          return _clientItem(client);
        },
      ),
    );
  }

  Widget _clientItem(ClientStore client) {
    return Observer(builder: (_) => Column(
      children: [
        ClientListItem(
          client.client,
          selected: client.selected,
          hide: client.hide,
          action: client.toggleSelected,
        ),
        SizedBox(height: 8),
      ],
    ),);
  }
}
