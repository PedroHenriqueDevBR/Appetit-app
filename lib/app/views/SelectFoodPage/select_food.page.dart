import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/models/food_demand.model.dart';
import 'package:maida_coffee_challenge/app/stores/selected_food.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/widgets/food_item_description.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/input.widget.dart';
import 'package:mobx/mobx.dart';

class SelectFoodPage extends StatefulWidget {
  Food food;

  SelectFoodPage(this.food);

  @override
  _SelectFoodPageState createState() => _SelectFoodPageState();
}

class _SelectFoodPageState extends State<SelectFoodPage> {
  TextEditingController _txtDescription = TextEditingController();
  AppColor _color = AppColor();
  AppString _string = AppString();
  SelectedFoodStore _foodStore = SelectedFoodStore();

  void _goBack() {
    Navigator.pop(context);
  }

  void _goBackAndReturnFoodSelected() {
    _foodStore.foodDemand.observations = _txtDescription.text;
    Navigator.pop(context, _foodStore.foodDemand);
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
                Divider(color: _color.progressIndicatorColor),
                _listOptionsContainer(),
                _observationsContainer(),
              ],
            ),
          ),
        ),
        Observer(builder: (_) => _selectAmountContainer(),),
      ],
    );
  }

  Widget _headerInformations() {
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

  Widget _listOptionsContainer() {
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

  Widget _observationsContainer() {
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

  Widget _selectAmountContainer() {
    if (_foodStore.foodDemand.food.options.length == 0 || _foodStore.isValidSelectedOption) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: _color.backgroundColor, boxShadow: [
          BoxShadow(
              color: _color.shadowColor,
              offset: Offset(0, 0),
              spreadRadius: 5,
              blurRadius: 5),
        ]),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _amountController(),
            _confimAmountButton(),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _confimAmountButton() {
    return Observer(
      builder: (_) => MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        padding: EdgeInsets.all(16),
        color: _color.primaryColor,
        child: Row(
          children: [
            Text(
              _string.add,
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            SizedBox(width: 16),
            Text(
              'R\$ ${_string.formatMoney(_foodStore.selectTotalPrice)}',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ],
        ),
        onPressed: _goBackAndReturnFoodSelected,
      ),
    );
  }

  Widget _amountController() {
    return Observer(
      builder: (_) => Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              size: 16,
            ),
            onPressed: _foodStore.removeAmounnt,
          ),
          SizedBox(width: 4),
          Text('${_foodStore.amount}'),
          SizedBox(width: 4),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 16,
              color: _color.primaryColor,
            ),
            onPressed: _foodStore.addAmounnt,
          ),
        ],
      ),
    );
  }
}
