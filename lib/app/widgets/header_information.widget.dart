import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';

class HeaderInformationWidget extends StatelessWidget {
  AppColor _color = AppColor();
  AppString _string = AppString();
  Widget child;
  int step;

  HeaderInformationWidget(this.step, {this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_string.demandInfo,
              style: TextStyle(fontSize: 24, color: _color.primaryDarkColor)),
          Divider(color: _color.secondaryColor, endIndent: 100, thickness: 2),
          Text(_string.fillFields, style: TextStyle(fontSize: 16)),
          SizedBox(height: 32),
          _statusInformation(),
          SizedBox(height: 32),
          this.child != null
              ? this.child
              : Container(),
        ],
      ),
    );
  }

  Widget _statusInformation() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(_string.whatSelling,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            Text('${this.step} de 3')
          ],
        ),
        SizedBox(height: 8),
        LinearProgressIndicator(
          backgroundColor: _color.progressIndicatorColor,
          value: 0.34 * this.step,
          valueColor: AlwaysStoppedAnimation<Color>(_color.primaryColor),
        ),
      ],
    );
  }
}