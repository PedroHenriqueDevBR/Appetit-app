import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:maida_coffee_challenge/app/stores/demand_history.store.dart';
import 'package:maida_coffee_challenge/app/views/DashboardPage/dashboard_demand_list.widget.dart';
import 'package:maida_coffee_challenge/app/views/DashboardPage/dashboard_header_information.widget.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TextEditingController _txtSearch = TextEditingController();
  DemandHistoryStore _historyStore = DemandHistoryStore();

  @override
  void initState() {
    _historyStore.setDemands();
    _historyStore.setUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              DashboardHeaderInformationWidget(_historyStore, _txtSearch),
              DashboardDemandListWidget(_historyStore),
            ],
          ),
        ),
      ),
    );
  }
}
