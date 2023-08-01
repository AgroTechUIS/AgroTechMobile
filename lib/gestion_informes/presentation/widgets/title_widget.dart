import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
    this.text, {
    Key? key,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: textColor ?? colors.textColor),
      ),
    );
  }
}
