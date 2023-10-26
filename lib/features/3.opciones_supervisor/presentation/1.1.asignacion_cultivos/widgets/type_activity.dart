import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OptionsAvtivity extends StatelessWidget {
  const OptionsAvtivity({
    super.key,
    required this.selectedState,
    required this.selectedController,
  });

  final String selectedState;
  final StateController<String> selectedController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: RadioListTile(
            title: const Text('Labranza'),
            value: 'Labranza',
            activeColor: colors.green3,
            groupValue: selectedState,
            onChanged: (value) {
              selectedController.update((state) => value ?? state);
            },
          ),
        ),
        SizedBox(
          height: 40,
          child: RadioListTile(
            title: const Text('Siembra'),
            value: 'Siembra',
            activeColor: colors.green3,
            groupValue: selectedState,
            onChanged: (value) {
              selectedController.update((state) => value ?? state);
            },
          ),
        ),
        SizedBox(
          height: 40,
          child: RadioListTile(
            title: const Text('Riego'),
            value: 'Riego',
            activeColor: colors.green3,
            groupValue: selectedState,
            onChanged: (value) {
              selectedController.update((state) => value ?? state);
            },
          ),
        ),
        SizedBox(
          height: 40,
          child: RadioListTile(
            title: const Text('Control de plagas'),
            value: 'fumigacion',
            activeColor: colors.green3,
            groupValue: selectedState,
            onChanged: (value) {
              selectedController.update((state) => value ?? state);
            },
          ),
        ),
        SizedBox(
          height: 40,
          child: RadioListTile(
            title: const Text('Poda'),
            value: 'Poda',
            activeColor: colors.green3,
            groupValue: selectedState,
            onChanged: (value) {
              selectedController.update((state) => value ?? state);
            },
          ),
        ),
        SizedBox(
          height: 40,
          child: RadioListTile(
            title: const Text('Cosecha'),
            value: 'Cosecha',
            activeColor: colors.green3,
            groupValue: selectedState,
            onChanged: (value) {
              selectedController.update((state) => value ?? state);
            },
          ),
        ),
      ],
    );
  }
}
