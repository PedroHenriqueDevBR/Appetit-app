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

  ClientListItem(this.client, {this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: _foodItem(context),
      decoration: BoxDecoration(
        color: Colors.white,
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
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      onTap: action,
    );
  }
}
