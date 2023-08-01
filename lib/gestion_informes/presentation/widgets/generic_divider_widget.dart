import 'package:flutter/material.dart';

class GenericDivider extends StatelessWidget {
  const GenericDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
      height: 20,
      indent: 20,
      endIndent: 20,
    );
  }
}
