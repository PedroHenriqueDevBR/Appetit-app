import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/models/demand_date.model.dart';
import 'package:maida_coffee_challenge/app/stores/demand_history.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';

class DashboardDemandListWidget extends StatelessWidget {
  AppString _string = AppString();
  AppColor _color = AppColor();
  DemandHistoryStore _historyStore;

  DashboardDemandListWidget(this._historyStore);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: _historyStore.demandsWithDate.length,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _dateList(context, index, _historyStore.demandsWithDate);
            },
          );
        },
      ),
    );
  }

  Widget _dateList(
      BuildContext context, int index, List<DemandDate> demandsWithDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_string.inDay} ${demandsWithDate[index].getSmallDate()} ${_string.saleDay} ${_string.formatMoney(demandsWithDate[index].total)}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 16),
        _demandList(demandsWithDate[index]),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _demandList(DemandDate demandsWithDate) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: demandsWithDate.demandlist.length,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Demand demand = demandsWithDate.demandlist[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: _color.backgroundColor,
            backgroundImage: AssetImage(demand.client.photo),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                demand.client.name,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                _string.formatMoney(demand.getDemandTotal()),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          subtitle: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              demand.getFoodNamesInLine(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
