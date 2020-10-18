import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/models/client.model.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';

class ClientListItem extends StatelessWidget {
  AppColor _color = AppColor();
  AppString _string = AppString();

  Client client;
  Function action;
  bool selected;
  bool hide;

  ClientListItem(this.client, {this.action, this.selected=false, this.hide=false});

  @override
  Widget build(BuildContext context) {
    return hide ? Container() : Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: _foodItem(context),
      decoration: BoxDecoration(
        color: this.selected ? _color.primaryColor : Colors.white,
        border: Border.all(
          color: _color.shadowColor,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: _color.shadowColor,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }

  ListTile _foodItem(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _color.backgroundColor,
        backgroundImage: AssetImage(client.photo),
      ),
      title: Text(
        client.name,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: this.selected ? Colors.white : Colors.black),
      ),
      onTap: action,
    );
  }
}
