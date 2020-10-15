import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/models/client.model.dart';
import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/utils/colors.utils.dart';
import 'package:maida_coffee_challenge/app/utils/string.utils.dart';
import 'package:maida_coffee_challenge/app/widgets/header_information.widget.dart';
import 'package:maida_coffee_challenge/app/widgets/shadow_container.widget.dart';

class CloseDemandPage extends StatefulWidget {
  Demand demand;
  List<Client> clients;

  CloseDemandPage(this.demand, this.clients);

  @override
  _CloseDemandPageState createState() => _CloseDemandPageState();
}

class _CloseDemandPageState extends State<CloseDemandPage> {
  AppColor _color = AppColor();
  AppString _string = AppString();
  Demand _demand;
  List<Client> _clients;
  bool _paid;
  DateTime _dateTime;

  void _togglePaid(value) {
    setState(() {
      _paid = value;
    });
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    this._demand = widget.demand;
    this._clients = widget.clients;
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
                HeaderInformationWidget(3, _string.finalizeDemand),
                _getDataFromDemand(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getDataFromDemand() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getPaidInformation(),
          SizedBox(height: 16),
          _getDate(),
        ],
      ),
    );
  }

  Widget _getDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _string.whitchDate,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 16),
        GestureDetector(
          child: ShadowContainerWidget(
            child: ListTile(
              leading: Icon(Icons.date_range),
              title: Text(
                  _dateTime == null ? _string.chooseDate : _dateTime.toString()
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ),
            ),
          ),
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 10),
              lastDate: DateTime(DateTime.now().year + 10),
              cancelText: '',
              confirmText: 'Confirmar',
              // locale: Locale.fromSubtags(languageCode: 'br'),
            ).then((date) {
              setState(() {
                this._dateTime = date;
              });
            });
          },
        ),
      ],
    );
  }

  Widget _getPaidInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _string.paindOrder,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 16),
        _radioList(),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _radioList() {
    return Column(
      children: [
        ShadowContainerWidget(
          child: _radio(_string.yes, true, _paid, _togglePaid),
        ),
        ShadowContainerWidget(
          child: _radio(_string.no, false, _paid, _togglePaid),
        ),
      ],
    );
  }

  Widget _radio(
      String title, dynamic value, dynamic groupValue, Function onChange) {
    return RadioListTile(
      value: value,
      groupValue: groupValue,
      activeColor: _color.primaryColor,
      onChanged: onChange,
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
