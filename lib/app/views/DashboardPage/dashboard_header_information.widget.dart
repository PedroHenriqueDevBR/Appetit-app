import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/stores/demand_history.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/views/DashboardPage/create_demand_button.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/search_field.widget.dart';

class DashboardHeaderInformationWidget extends StatelessWidget {

  AppString _string = AppString();
  AppColor _color = AppColor();
  DemandHistoryStore _historyStore;
  TextEditingController _txtSearch;

  DashboardHeaderInformationWidget(this._historyStore, this._txtSearch);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_string.hello} ${_historyStore.user.name}',
          style: TextStyle(
            fontSize: 24,
            color: _color.primaryDarkColor,
          ),
        ),
        Divider(
          color: _color.secondaryColor,
          endIndent: 100,
          thickness: 2,
        ),
        SizedBox(height: 32),
        CreateDemandButton(() {
          _historyStore.goTocreateDemandPage(context);
        }),
        SizedBox(height: 32),
        SearchField(_txtSearch, _historyStore.search),
        SizedBox(height: 32),
      ],
    );
  }
}

