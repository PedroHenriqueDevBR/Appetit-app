import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/stores/selected_food.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';

class OptionsFoodListWidget extends StatelessWidget {
  AppString _string = AppString();
  AppColor _color = AppColor();
  SelectedFoodStore _foodStore;

  OptionsFoodListWidget(this._foodStore);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _string.options,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            _string.optionsDescription,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          _listOptionsFromFood()
        ],
      ),
    );
  }

  Widget _listOptionsFromFood() {
    return ListView.builder(
      itemCount: _foodStore.foodDemand.food.options.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: _color.progressIndicatorColor,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: _foodOptionItem(index),
        );
      },
    );
  }

  Widget _foodOptionItem(int index) {
    return Observer(builder: (_) => RadioListTile(
      value: _foodStore.foodDemand.food.options[index],
      title: Text(
        _foodStore.foodDemand.food.options[index],
        style: TextStyle(fontSize: 16),
      ),
      groupValue: _foodStore.selectedOption,
      onChanged: _foodStore.setSelectedOption,
      activeColor: _color.primaryColor,
    ),);
  }
}
