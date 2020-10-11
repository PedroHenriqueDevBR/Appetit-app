import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utilx.dart';
import 'package:maida_coffee_challenge/app/views/LoginPage/login.page.dart';

class AppWidget extends StatelessWidget {

  AppColor _color = AppColor();
  AppString _string = AppString();

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
      title: _string.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: _color.primaryColor,
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