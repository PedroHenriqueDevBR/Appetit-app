import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';

class ForwardButtonWidget extends StatelessWidget {
  AppColor _color = AppColor();
  AppString _string = AppString();
  int amount;
  Function goToCloseDemandPage;

  ForwardButtonWidget(this.amount, this.goToCloseDemandPage);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(16),
        color: _color.primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _forwardButtonClientsAmount(),
            _forwardButtonGo(),
          ],
        ),
      ),
      onTap: goToCloseDemandPage,
    );
  }

  Widget _forwardButtonClientsAmount() {
    return Text(
      amount == 1
          ? '${amount} ${_string.oneSelectedClient}'
          : '${amount} ${_string.manySelectedClients}',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _forwardButtonGo() {
    return Row(
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
    );
  }
}
