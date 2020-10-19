import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/stores/selected_food.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';

class AmountContainerWidget extends StatelessWidget {
  AppString _string = AppString();
  AppColor _color = AppColor();
  SelectedFoodStore _foodStore;
  BuildContext context;
  TextEditingController _txtDescription;

  AmountContainerWidget(this.context, this._foodStore, this._txtDescription);

  void _goBackAndReturnFoodSelected() {
    _foodStore.foodDemand.observations = _txtDescription.text;
    Navigator.pop(context, _foodStore.foodDemand);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => _foodStore.isValidSelectedOption || _foodStore.foodDemand.food.options.isEmpty
          ? Container(
              padding: EdgeInsets.all(16),
              decoration:
                  BoxDecoration(color: _color.backgroundColor, boxShadow: [
                BoxShadow(
                    color: _color.shadowColor,
                    offset: Offset(0, 0),
                    spreadRadius: 5,
                    blurRadius: 5),
              ]),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _amountController(),
                  _confimAmountButton(),
                ],
              ),
            )
          : Container(),
    );
  }

  Widget _confimAmountButton() {
    return Observer(
      builder: (_) => MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        padding: EdgeInsets.all(16),
        color: _color.primaryColor,
        child: Row(
          children: [
            Text(
              _string.add,
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            SizedBox(width: 16),
            Text(
              'R\$ ${_string.formatMoney(_foodStore.selectTotalPrice)}',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ],
        ),
        onPressed: _goBackAndReturnFoodSelected,
      ),
    );
  }

  Widget _amountController() {
    return Observer(
      builder: (_) => Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              size: 16,
            ),
            onPressed: _foodStore.removeAmounnt,
          ),
          SizedBox(width: 4),
          Text('${_foodStore.amount}'),
          SizedBox(width: 4),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 16,
              color: _color.primaryColor,
            ),
            onPressed: _foodStore.addAmounnt,
          ),
        ],
      ),
    );
  }
}
