import 'package:flutter/material.dart';

class TextItemWidget extends StatelessWidget {
  const TextItemWidget({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    const styleText = TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

    return Row(children: [
      Flexible(
          flex: 1,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: styleText,
            ),
          )),
      Flexible(
          flex: 3,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              text,
              style: styleText,
            ),
          ))
    ]);
  }
}
