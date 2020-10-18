import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/routes.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/widgets/button.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/outline_button.widget.dart';

class EndPage extends StatefulWidget {
  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  AppString _string = AppString();

  void _goToNewDemandPage() {
    Navigator.pushReplacementNamed(context, AppRoute.DEMAND_INFORMATION_ROUTE);
  }

  void _goToDashboardPage() {
    Navigator.pushReplacementNamed(context, AppRoute.DASHBOARD_ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/chef.png'),
                SizedBox(height: 16),
                Text(
                  _string.doneDemand,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ButtonWidget(_goToNewDemandPage, _string.newDemand, enable: true,),
                SizedBox(height: 12),
                OutlineButtonWidget(_goToDashboardPage, _string.goToHomePage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
