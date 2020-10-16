import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maida_coffee_challenge/app/routes.dart';
import 'package:maida_coffee_challenge/app/stores/login.store.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/views/LoginPage/box.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/button.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/input.widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppColor _color = AppColor();
  AppString _string = AppString();
  TextEditingController _txtMail = new TextEditingController();
  TextEditingController _txtPassword = new TextEditingController();

  LoginStore _loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color.backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _logoWidget(),
            BoxWidget(),
            _wellcome(),
            BoxWidget(),
            _inputContainer(),
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
        'assets/images/app_logo.png',
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _wellcome() {
    return Column(
      children: [
        Text(
          _string.wellcome,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: _color.primaryDarkColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            _string.wellcomeDescription,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _inputContainer() {
    return Column(
      children: [
        InputWidget(
          _txtMail,
          _string.emailInput,
          label: _string.email,
          bordered: true,
          onChangeAction: _loginStore.setEmail,
        ),
        BoxWidget(),
        Observer(
          builder: (_) => InputWidget(
            _txtPassword,
            _string.passwordInput,
            label: _string.password,
            bordered: true,
            isPassword: _loginStore.hidePassword,
            onChangeAction: _loginStore.setPassowd,
            suffix: IconButton(
                icon: Icon(_loginStore.hidePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: _loginStore.togglePassword),
          ),
        ),
        BoxWidget(),
        BoxWidget(),
        Observer(
          builder: (_) {
            return ButtonWidget(
              () {
                _loginStore.goToDashboardPage(context);
              },
              _string.enterButton,
              enable: _loginStore.validForm,
            );
          },
        ),
      ],
    );
  }
}
