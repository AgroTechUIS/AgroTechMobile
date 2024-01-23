import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:flutter/material.dart';

class ButtonDateWidget extends StatelessWidget {
  const ButtonDateWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.date,
  });

  final String text;
  final DateTime? date;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.rp(100),
      height: context.rp(65),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: colors.white,
                size: 20,
              ),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => onTap(),
            child: Container(
              height: context.rp(25),
              decoration: BoxDecoration(
                color: colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(),
                  Text(
                    date == null ? '---- -- --' : date.toString().split(' ').first,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.textColor,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: colors.textColor,
                    size: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
