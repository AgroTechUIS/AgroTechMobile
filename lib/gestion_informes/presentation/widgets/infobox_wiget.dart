import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    Key? key,
    required this.screenSize,
    required this.title,
    required this.value,
    this.backgroundColor,
    this.textColorFirst,
    this.textColorSecond,
  }) : super(key: key);

  final Size screenSize;
  final String title;
  final String value;
  final Color? backgroundColor;
  final Color? textColorFirst;
  final Color? textColorSecond;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 1000,
          decoration: BoxDecoration(
            color: backgroundColor ?? colors.textColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                    fontSize: 12,
                    color: textColorFirst ?? colors.green3,
                    fontWeight: FontWeight.w700,
                  )),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorSecond ?? colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
