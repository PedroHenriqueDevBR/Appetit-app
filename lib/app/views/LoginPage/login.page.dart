import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppColor _color = AppColor() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _logoWidget(),
          ],
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/images/logo.jpg',
        width: 200,
        height: 200,
      ),
    );
  }
}
