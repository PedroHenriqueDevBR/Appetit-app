import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/models/food_demand.model.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/widgets/food_item_description.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/input.widget.dart';

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
  FoodDemand _foodDemand;
  String _selectedOption = '';

  void _goBack() {
    Navigator.pop(context);
  }

  void _goBackAndReturnFoodSelected() {
    Navigator.pop(context, _foodDemand);
  }

  void _addAmount() {
    setState(() {
      _foodDemand.amount++;
    });
  }

  void _removeAmount() {
    setState(() {
      if (_foodDemand.amount > 1) {
        _foodDemand.amount--;
      }
    });
  }

  @override
  void initState() {
    _foodDemand = FoodDemand.creator(widget.food);
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
        _selectAmountContainer(),
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
          FoodItemDescription(widget.food),
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
      itemCount: widget.food.options.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          child: _foodOptionItem(index),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: _color.progressIndicatorColor,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        );
      },
    );
  }

  Widget _foodOptionItem(int index) {
    return RadioListTile(
      value: _foodDemand.food.options[index],
      title: Text(
        widget.food.options[index],
        style: TextStyle(fontSize: 16),
      ),
      groupValue: _selectedOption,
      onChanged: (value) {
        _foodDemand.selectedOption = value;
        setState(() {
          _selectedOption = value;
        });
      },
      activeColor: _color.primaryColor,
    );
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
    if (widget.food.options.length == 0 || _foodDemand.selectedOption != null) {
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
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      padding: EdgeInsets.all(16),
      color: _color.primaryColor,
      child: Row(
        children: [
          Text(
            _string.add,
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          SizedBox(width: 16),
          Text(
            'R\$ ${_string.formatMoney(_foodDemand.getTotalPrice())}',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ],
      ),
      onPressed: () {},
    );
  }

  Widget _amountController() {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.remove,
            size: 16,
          ),
          onPressed: _removeAmount,
        ),
        SizedBox(width: 4),
        Text('${_foodDemand.amount}'),
        SizedBox(width: 4),
        IconButton(
          icon: Icon(
            Icons.add,
            size: 16,
            color: _color.primaryColor,
          ),
          onPressed: _addAmount,
        ),
      ],
    );
  }
}
