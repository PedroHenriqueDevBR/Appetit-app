import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';

class CreateDemandButton extends StatelessWidget {

  AppColor _color = AppColor();
  AppString _string = AppString();
  Function action;

  CreateDemandButton(this.action);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlineButton(
            onPressed: action,
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: _color.primaryColor,
                ),
                SizedBox(width: 8),
                Text(_string.newDemand.toUpperCase()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
