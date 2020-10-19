import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/stores/selected_food.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/views/SelectFoodPage/amount_container.widget.dart';
import 'package:maida_coffee_challenge/app/views/SelectFoodPage/observations_container.widget.dart';
import 'package:maida_coffee_challenge/app/views/SelectFoodPage/options_food_list.widget.dart';
import 'package:maida_coffee_challenge/app/views/SelectFoodPage/select_food_header.widget.dart';

class SelectFoodPage extends StatefulWidget {
  Food food;

  SelectFoodPage(this.food);

  @override
  _SelectFoodPageState createState() => _SelectFoodPageState();
}

class _SelectFoodPageState extends State<SelectFoodPage> {
  TextEditingController _txtDescription = TextEditingController();
  AppColor _color = AppColor();
  SelectedFoodStore _foodStore = SelectedFoodStore();

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    _foodStore.setFoodDemand(widget.food);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: _goBack),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SelectFoodHeaderWidget(_foodStore),
                  Divider(color: _color.progressIndicatorColor),
                  OptionsFoodListWidget(_foodStore),
                  ObservationsContainerWidget(_txtDescription),
                ],
              ),
            ),
          ),
          AmountContainerWidget(context, _foodStore, _txtDescription),
        ],
      ),
    );
  }
}
