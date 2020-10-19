import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/stores/selected_food.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/widgets/food_item_description.widget.dart';

class SelectFoodHeaderWidget extends StatelessWidget {
  AppString _string = AppString();
  AppColor _color = AppColor();
  SelectedFoodStore _foodStore;

  SelectFoodHeaderWidget(this._foodStore);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _string.demandDetails,
            style: TextStyle(fontSize: 24, color: _color.primaryDarkColor),
          ),
          Divider(color: _color.secondaryColor, endIndent: 100, thickness: 2),
          Text(
            _string.demandDetailsDescription,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 32),
          FoodItemDescription(_foodStore.foodDemand.food),
        ],
      ),
    );
  }
}
