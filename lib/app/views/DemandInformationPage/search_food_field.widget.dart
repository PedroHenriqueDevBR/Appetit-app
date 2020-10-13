import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/widgets/input.widget.dart';

class SearchFoodField extends StatelessWidget {

  AppString _string = AppString();
  AppColor _color = AppColor();
  TextEditingController _txtSearch;
  Function changeAction = (value){};

  SearchFoodField(this._txtSearch, this.changeAction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.search, color: _color.primaryColor,),
              SizedBox(width: 8),
              Expanded(child: InputWidget(_txtSearch, _string.search, onChangeAction: changeAction,)),
            ],
          ),
          Divider(color: Colors.black,),
        ],
      ),
    );
  }
}
