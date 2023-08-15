import 'package:flutter/material.dart';

class HeaderPageWidget extends StatelessWidget {
  const HeaderPageWidget(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}
