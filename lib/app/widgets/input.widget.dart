import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  TextEditingController controller;
  String hint;
  String label;
  List<TextInputFormatter> formatters;
  TextInputType type;
  bool isPassword;
  Function validator;
  bool readOnly;
  bool bordered;
  String selectedLabel;
  Function onChangeAction = (value) {};
  IconButton suffix;
  TextInputAction textInputAction;

  InputWidget(
    this.controller,
    this.hint, {
    this.formatters,
    this.type,
    this.isPassword = false,
    this.validator,
    this.readOnly = false,
    this.bordered = false,
    this.label = '',
    this.selectedLabel = '',
    this.onChangeAction,
    this.suffix,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    type = type == null ? TextInputType.text : type;
    return TextFormField(
      keyboardType: type,
      obscureText: isPassword,
      cursorColor: Colors.black,
      controller: controller,
      inputFormatters: formatters,
      readOnly: readOnly,
      style: TextStyle(
          color: Colors.black, decorationColor: Colors.black, fontSize: 17),
      onChanged: onChangeAction,
      decoration: InputDecoration(
        labelText: bordered ? hint : null,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        border: bordered
            ? OutlineInputBorder()
            : UnderlineInputBorder(borderSide: BorderSide.none),
        suffixIcon: suffix,
      ),
      validator: validator,
      textInputAction: textInputAction,
    );
  }
}
