import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({Key? key, required this.children, this.background, this.padding}) : super(key: key);

  final List<Widget> children;
  final Color? background;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 0,
      color: background ?? colors.blackTransparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: padding ?? 0),
        child: Column(children: children),
      ),
    );
  }
}
