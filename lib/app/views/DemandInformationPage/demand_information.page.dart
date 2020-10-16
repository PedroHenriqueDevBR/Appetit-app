import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/models/food_category.model.dart';
import 'package:maida_coffee_challenge/app/routes.dart';
import 'package:maida_coffee_challenge/app/stores/demand_information.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/widgets/food_item_description.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/food_item_description_selected.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/header_information.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/search_field.widget.dart';

class DemandInformationPage extends StatefulWidget {
  @override
  _DemandInformationPageState createState() => _DemandInformationPageState();
}

class _DemandInformationPageState extends State<DemandInformationPage> {
  AppColor _color = AppColor();
  AppString _string = AppString();
  DemandInformationStore _informationStore = DemandInformationStore();
  TextEditingController _txtSearch = TextEditingController();

  void _closePage() {
    Navigator.pop(context);
  }

  void _goToSelectProductPage() {
    Navigator.pushNamed(context, AppRoute.LIST_CLIENTS_ROUTE,
        arguments: _informationStore.demandOnRequest);
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
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _headerInformations(),
                _foodListContainer(),
              ],
            ),
          ),
        ),
        _forwardButton(),
      ],
    );
  }

  Widget _headerInformations() {
    return HeaderInformationWidget(
      1,
      _string.whatSelling,
      child: Column(
        children: [
          SearchField(_txtSearch, _informationStore.searchFood),
          SizedBox(height: 32),
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
                      _informationStore.demandOnRequest.addFood(food);
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

  Widget _forwardButton() {
    if (_informationStore.demandOnRequest.foodList.length > 0) {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(16),
          color: _color.primaryColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_string.total} ${_string.formatMoney(_informationStore.demandOnRequest.getDemandTotal())}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${_string.goForward}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: _goToSelectProductPage,
      );
    } else {
      return Container();
    }
  }
}
