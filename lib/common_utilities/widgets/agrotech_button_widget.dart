import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:flutter/material.dart';

class AgrotechButton extends StatelessWidget {
  const AgrotechButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          colors.appbar,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
