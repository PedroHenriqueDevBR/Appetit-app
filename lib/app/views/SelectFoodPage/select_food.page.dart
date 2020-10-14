import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/models/food_demand.model.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';

class SelectFoodPage extends StatefulWidget {
  Food food;
  SelectFoodPage(this.food);
  @override
  _SelectFoodPageState createState() => _SelectFoodPageState();
}

class _SelectFoodPageState extends State<SelectFoodPage> {

  AppColor _color = AppColor();
  AppString _string = AppString();
  FoodDemand foodDemand;

  @override
  void initState() {
    foodDemand = FoodDemand.creator(widget.food);
    super.initState();
  }

  void goBack() {
    Navigator.pop(context, foodDemand);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: goBack),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _headerInformations(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _headerInformations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_string.demandInfo, style: TextStyle(fontSize: 24, color: _color.primaryDarkColor)),
        Divider(color: _color.secondaryColor, endIndent: 100, thickness: 2),
        Text(_string.fillFields, style: TextStyle(fontSize: 16)),
        SizedBox(height: 32),
      ],
    );
  }
}
