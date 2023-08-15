import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(text)),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Colors.transparent,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 0.0,
                ),
              ),
              child: Slider(
                // Resto de las propiedades del Slider
                activeColor: colors.green3,
                value: 0.5,
                min: 0.0,
                max: 1.0,
                onChanged: (newValue) {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
