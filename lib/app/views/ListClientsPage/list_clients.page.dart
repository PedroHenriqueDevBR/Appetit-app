import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/models/client.model.dart';
import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/singleton/fake_data.singleton.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/widgets/client_list_item.widget.dart';
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
  Demand _demandOnRequest;
  List<Client> _clients = [];
  List<Client> _presentationClients = [];
  List<int> _selectedPositions = [];

  void _togglePosition(int position) {
    int index = _selectedPositions.indexOf(position);
    if (index >= 0) {
      setState(() {
        _selectedPositions.removeAt(index);
      });
    } else {
      setState(() {
        _selectedPositions.add(position);
      });
    }
  }

  bool _clientAdded(int index) {
    return _selectedPositions.indexOf(index) >= 0;
  }

  void _goBack() {
    Navigator.pop(context);
  }

  void _searchClient(String keyword) {
    keyword = keyword.toLowerCase();
    if (keyword.isEmpty) {
      setState(() {
        this._presentationClients = _clients;
      });
    } else {
      List<Client> clientAux = [];
      this._clients.forEach((Client client) {
        String clientName = client.name.toLowerCase();
        if (clientName.contains(keyword)) {
          clientAux.add(client);
        }
      });
      setState(() {
        _presentationClients = clientAux;
      });
    }
  }

  @override
  void initState() {
    this._demandOnRequest = widget.demand;
    this._clients = FakeDataSingleton.instance.clients;
    this._presentationClients = FakeDataSingleton.instance.clients;
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
        _forwardButton(),
      ],
    );
  }

  Widget _headerInformations() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_string.demandInfo,
              style: TextStyle(fontSize: 24, color: _color.primaryDarkColor)),
          Divider(color: _color.secondaryColor, endIndent: 100, thickness: 2),
          Text(_string.fillFields, style: TextStyle(fontSize: 16)),
          SizedBox(height: 32),
          _demandStatus(),
          SizedBox(height: 32),
          SearchField(_txtSearch, _searchClient),
        ],
      ),
    );
  }

  Widget _demandStatus() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(_string.whatSelling,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            Text('2 de 3')
          ],
        ),
        SizedBox(height: 8),
        LinearProgressIndicator(
          backgroundColor: _color.progressIndicatorColor,
          value: 0.66,
          valueColor: AlwaysStoppedAnimation<Color>(_color.primaryColor),
        ),
      ],
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
    return ListView.builder(
      itemCount: _presentationClients.length,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Client client = _presentationClients[index];
        return Column(
          children: [
            ClientListItem(
              client,
              selected: _clientAdded(index),
              action: () {
                _togglePosition(index);
              },
            ),
            SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget _forwardButton() {
    if (_selectedPositions.length > 0) {
      return Container(
        padding: EdgeInsets.all(16),
        color: _color.primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedPositions.length == 1
                  ? '${this._selectedPositions.length} ${_string.oneSelectedClient}'
                  : '${this._selectedPositions.length} ${_string.manySelectedClients}',
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
      );
    } else {
      return Container();
    }
  }
}
