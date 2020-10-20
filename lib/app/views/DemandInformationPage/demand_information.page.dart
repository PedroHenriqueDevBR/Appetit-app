import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/models/food_category.model.dart';
import 'package:maida_coffee_challenge/app/routes.dart';
import 'package:maida_coffee_challenge/app/stores/demand_information.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/views/DemandInformationPage/demand_forward_button.widget.dart';
import 'package:maida_coffee_challenge/app/views/DemandInformationPage/demand_header.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/food_item_description.widget.dart';

class DemandInformationPage extends StatefulWidget {
  @override
  _DemandInformationPageState createState() => _DemandInformationPageState();
}

class _DemandInformationPageState extends State<DemandInformationPage> {
  AppColor _color = AppColor();
  DemandInformationStore _informationStore = DemandInformationStore();
  TextEditingController _txtSearch = TextEditingController();

  void _closePage() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    _informationStore.setFoodCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: _closePage),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DemandHeaderWidget(_informationStore, _txtSearch),
                  _foodListContainer(),
                ],
              ),
            ),
          ),
          DemandForwardButtonWidget(context, _informationStore),
        ],
      ),
    );
  }

  Widget _foodListContainer() {
    return Container(
      child: Observer(
        builder: (_) => ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: _color.progressIndicatorColor,
          ),
          itemCount: _informationStore.foods.length,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: _categoryList(context, _informationStore.foods[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _categoryList(BuildContext context, FoodCategory foodCategory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${foodCategory.name}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 16),
        _foodList(foodCategory.foodList),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _foodList(List<Food> foods) {
    return ListView.builder(
      itemCount: foods.length,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Food food = foods[index];
        _informationStore.setCurrentFood(food);
        return Column(
          children: [
            FoodItemDescription(
              food,
              applyShadow: true,
              selected: _informationStore.foodHasSelected,
              action: () async {
                await Navigator.pushNamed(context, AppRoute.SELECT_FOOD_ROUTE,
                    arguments: food)
                    .then((food) {
                  if (food != null) {
                    setState(() {
                      _informationStore.addFood(food);
                    });
                  }
                });
              },
            ),
            SizedBox(height: 8),
          ],
        );
      },
    );
  }
}
