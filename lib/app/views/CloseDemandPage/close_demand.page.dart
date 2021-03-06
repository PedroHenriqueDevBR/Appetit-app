import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/models/client.model.dart';
import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/routes.dart';
import 'package:maida_coffee_challenge/app/stores/demand.store.dart';
import 'package:maida_coffee_challenge/app/stores/status_demand.store.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/views/CloseDemandPage/radio_item.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/button.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/header_information.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/shadow_container.widget.dart';

class CloseDemandPage extends StatefulWidget {
  Demand demand;
  List<Client> clients;

  CloseDemandPage(this.demand, this.clients);

  @override
  _CloseDemandPageState createState() => _CloseDemandPageState();
}

class _CloseDemandPageState extends State<CloseDemandPage> {
  AppString _string = AppString();
  StatusDemandStore _statusDemandStore = StatusDemandStore();

  void _goBack() {
    Navigator.pop(context);
  }

  void _goToEndPage() {
    _statusDemandStore.registerDemands();
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoute.END_ROUTE, (route) => false);
  }

  @override
  void initState() {
    _statusDemandStore.setDemand(widget.demand);
    _statusDemandStore.setClients(widget.clients);
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
                  HeaderInformationWidget(3, _string.finalizeDemand),
                  _getDataFromDemand(),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Observer(
              builder: (_) => ButtonWidget(
                _goToEndPage,
                _string.finalizeDemand,
                enable: _statusDemandStore.enableButton,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getDataFromDemand() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getPaidInformation(),
          SizedBox(height: 16),
          _getDateContainer(),
        ],
      ),
    );
  }

  Widget _getDateContainer() {
    DemandStore demandStore = _statusDemandStore.demandStore;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _string.whitchDate,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 16),
        GestureDetector(
          child: _getDateTile(demandStore),
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 10),
              lastDate: DateTime(DateTime.now().year + 10),
              cancelText: '',
              confirmText: _string.confirm,
              locale: Locale("pt", "BR"),
            ).then(
              (date) {
                demandStore.setDate(_string.formatDate(date));
              },
            );
          },
        ),
      ],
    );
  }

  Widget _getDateTile(DemandStore demandStore) {
    return Observer(
      builder: (_) => ShadowContainerWidget(
        child: ListTile(
          leading: Icon(Icons.date_range),
          title: Text(
            demandStore.date == null || demandStore.date.isEmpty
                ? this._string.chooseDate
                : demandStore.date,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ),
      ),
    );
  }

  Widget _getPaidInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _string.paindOrder,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 16),
        _radioList(),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _radioList() {
    DemandStore demandStore = _statusDemandStore.demandStore;
    return Observer(
      builder: (_) => Column(
        children: [
          ShadowContainerWidget(
            child: RadioItemWidget(
              _string.yes,
              true,
              demandStore.paid,
              demandStore.togglePaid,
            ),
          ),
          ShadowContainerWidget(
            child: RadioItemWidget(
              _string.no,
              false,
              demandStore.paid,
              demandStore.togglePaid,
            ),
          ),
        ],
      ),
    );
  }
}
