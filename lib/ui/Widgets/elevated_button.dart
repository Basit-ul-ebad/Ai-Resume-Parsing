import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/const.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class AppElevatedButton extends StatelessWidget {
  String text;
  Function function;

  // ignore: use_key_in_widget_constructors
  AppElevatedButton(this.text, this.function);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      width: context.width(),
      text: text,
      color: kMainColor,
      onTap: function,
      elevation: 0,
      textStyle: TextStyle(
          color: kElevatedButtonTextColor, fontWeight: FontWeight.bold),
      shapeBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide.none),
    );
  }
}
