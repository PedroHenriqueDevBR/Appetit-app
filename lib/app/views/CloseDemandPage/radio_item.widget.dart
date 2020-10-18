import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';

class RadioItemWidget extends StatelessWidget {
  AppColor _color = AppColor();
  String title;
  dynamic value;
  dynamic groupValue;
  Function onChange;


  RadioItemWidget(this.title, this.value, this.groupValue, this.onChange);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: groupValue,
      activeColor: _color.primaryColor,
      onChanged: onChange,
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}

