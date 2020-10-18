import 'package:flutter/cupertino.dart';
import 'package:maida_coffee_challenge/app/routes.dart';
import 'package:mobx/mobx.dart';

part 'login.store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  bool hidePassword = true;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void togglePassword() {
    this.hidePassword = !this.hidePassword;
  }

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setPassowd(String password) => this.password = password;

  @computed
  bool get validEmail => RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this.email);

  @computed
  bool get validPassword => password.length >= 6;

  @computed
  bool get validForm => validEmail && validPassword;

  void goToDashboardPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.DASHBOARD_ROUTE);
  }

}
