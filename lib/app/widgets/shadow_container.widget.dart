import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';

class ShadowContainerWidget extends StatelessWidget {
  AppColor _color = AppColor();
  Widget child;

  ShadowContainerWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      child: child,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: _color.progressIndicatorColor,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }
}
