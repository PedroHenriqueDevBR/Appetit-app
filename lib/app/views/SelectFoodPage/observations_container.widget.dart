import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/widgets/input.widget.dart';

class ObservationsContainerWidget extends StatelessWidget {
  AppString _string = AppString();
  TextEditingController _txtDescription;
  
  ObservationsContainerWidget(this._txtDescription);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _string.observations,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(height: 16),
          InputWidget(
            _txtDescription,
            _string.observationsInput,
            bordered: true,
          )
        ],
      ),
    );
  }
}
