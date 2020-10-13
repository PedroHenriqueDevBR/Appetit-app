import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/models/food_category.model.dart';
import 'package:maida_coffee_challenge/app/singleton/fake_data.singleton.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/views/DemandInformationPage/search_food_field.widget.dart';

class DemandInformationPage extends StatefulWidget {
  @override
  _DemandInformationPageState createState() => _DemandInformationPageState();
}

class _DemandInformationPageState extends State<DemandInformationPage> {
  AppColor _color = AppColor();
  AppString _string = AppString();
  List<FoodCategory> _foods = FakeDataSingleton.instance.user.foodCategoryList;
  TextEditingController _txtSearch = TextEditingController();

  String _formatMoney(double money) {
    String moneyString = money.toString();
    List<String> moneySplited = moneyString.split('.');

    if (moneySplited.length == 0) {
      moneyString = '0,00';
    } else if (moneySplited.length == 1) {
      moneyString = moneySplited[0] + ',00';
    } else {
      if (moneySplited[1].length == 1) {
        moneyString = moneySplited[0] + ',' + moneySplited[1] + '0';
      } else {
        moneyString = moneyString.replaceAll('.', ',');
      }
    }
    return moneyString;
  }

  void _searchFood(String search) {
    setState(() {
      if (search.isEmpty) {
        _foods = FakeDataSingleton.instance.user.foodCategoryList;
      } else {
        _foods = FakeDataSingleton.instance.user.searchFoods(search);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _headerInformations(),
          _foodListContainer(),
        ],
      ),
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
        _demandStatus(),
        SizedBox(height: 32),
        SearchFoodField(_txtSearch, _searchFood),
        SizedBox(height: 32),
      ],
    );
  }

  Widget _demandStatus() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(_string.whatSelling, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            Text('1 de 3')
          ],
        ),
        SizedBox(height: 8),
        LinearProgressIndicator(
          backgroundColor: _color.progressIndicatorColor,
          value: 0.33,
          valueColor: AlwaysStoppedAnimation<Color>(_color.primaryColor),
        ),
      ],
    );
  }

  Widget _foodListContainer() {
    return Container(
      child: ListView.builder(
        itemCount: _foods.length,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _categoryList(context, _foods[index]);
        },
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
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: foods.length,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Food food = foods[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: _color.backgroundColor,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          trailing: Text(
            'R\$ ${_formatMoney(food.price)}',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          title: Text(
            food.name,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          subtitle: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              'sd lkajsdhaljk shdfkjlas hdflkasjhdf jlk nashdfguawye fjhsadfg uisaftdg',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
