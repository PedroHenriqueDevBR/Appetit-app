import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/routes.dart';
import 'package:maida_coffee_challenge/app/stores/demand_information.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';

class DemandForwardButtonWidget extends StatelessWidget {
  AppString _string = AppString();
  AppColor _color = AppColor();
  DemandInformationStore _informationStore;
  BuildContext context;

  DemandForwardButtonWidget(this.context, this._informationStore);

  void _goToSelectProductPage() {
    Navigator.pushNamed(context, AppRoute.LIST_CLIENTS_ROUTE,
        arguments: _informationStore.demandOnRequest);
  }

  @override
  Widget build(BuildContext context) {
    if (_informationStore.demandOnRequest.foodList.length > 0) {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(16),
          color: _color.primaryColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_string.total} ${_string.formatMoney(_informationStore.demandOnRequest.getDemandTotal())}',
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
        onTap: _goToSelectProductPage,
      );
    } else {
      return Container();
    }
  }
}
