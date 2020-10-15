import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';

class OutlineButtonWidget extends StatelessWidget {
  Function action;
  String text;
  AppColor _color = AppColor();

  OutlineButtonWidget(this.action, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _color.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(32)),
        border: Border.all(color: _color.secondaryColor, width: 2),
      ),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16),
        textColor: _color.secondaryColor,
        elevation: 0,
        color: _color.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        onPressed: action,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
