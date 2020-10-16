import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';

class ButtonWidget extends StatelessWidget {
  Function action;
  String text;
  AppColor _color = AppColor();
  bool enable;

  ButtonWidget(this.action, this.text, {this.enable = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      textColor: Colors.white,
      elevation: 0,
      color: enable ? _color.primaryColor : _color.disableColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      onPressed: enable ? action : (){},
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

    );
  }
}
