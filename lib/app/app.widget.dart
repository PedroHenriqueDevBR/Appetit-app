import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/views/LoginPage/login.page.dart';

class AppWidget extends StatelessWidget {

  AppColor _color = AppColor();

  void changeNavigatorColor() {
    dynamic systemTheme = SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: _color.backgroundColor,
      systemNavigationBarColor: _color.backgroundColor,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
  }

  @override
  Widget build(BuildContext context) {
    changeNavigatorColor();
    return MaterialApp(
      title: 'Maida Coffee Challenger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: coffeeAppBarTheme(),
      ),
      home: LoginPage(),
    );
  }

  AppBarTheme coffeeAppBarTheme() {
    return AppBarTheme(
      elevation: 0,
      color: _color.backgroundColor,
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black),
    );
  }
}