import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  VoidCallback? onPressed;
  MyButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(text),
      textColor: textColor,
    );
  }
}
