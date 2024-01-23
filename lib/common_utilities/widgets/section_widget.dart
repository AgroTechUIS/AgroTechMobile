import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({Key? key, required this.children, this.background, this.padding}) : super(key: key);

  final List<Widget> children;
  final Color? background;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: background ?? colors.blackTransparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Column(children: children),
      ),
    );
  }
}
