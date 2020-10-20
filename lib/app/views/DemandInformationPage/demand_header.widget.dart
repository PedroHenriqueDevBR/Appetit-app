import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/stores/demand_information.store.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/widgets/header_information.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/search_field.widget.dart';

class DemandHeaderWidget extends StatelessWidget {
  AppString _string = AppString();
  DemandInformationStore _informationStore;
  TextEditingController _txtSearch;


  DemandHeaderWidget(this._informationStore, this._txtSearch);

  @override
  Widget build(BuildContext context) {
    return HeaderInformationWidget(
      1,
      _string.whatSelling,
      child: Column(
        children: [
          SearchField(_txtSearch, _informationStore.searchFood),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
