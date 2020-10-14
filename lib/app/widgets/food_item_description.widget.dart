import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';

class FoodItemDescription extends StatelessWidget {
  AppColor _color = AppColor();
  AppString _string = AppString();
  Food food;
  bool applyShadow;
  Function action;

  FoodItemDescription(this.food, {this.action, this.applyShadow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _foodItem(context),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: _color.shadowColor,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        boxShadow: applyShadow
            ? [
                BoxShadow(
                  color: _color.shadowColor,
                  blurRadius: 4,
                  spreadRadius: 2,
                  offset: Offset(0, 0),
                ),
              ]
            : [],
      ),
    );
  }

  ListTile _foodItem(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _color.backgroundColor,
        backgroundImage: AssetImage('assets/images/avatar.png'),
      ),
      trailing: Text(
        'R\$ ${_string.formatMoney(food.price)}',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      title: Text(
        food.name,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      subtitle: Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          food.getOptionsInLine(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: action,
    );
  }
}
