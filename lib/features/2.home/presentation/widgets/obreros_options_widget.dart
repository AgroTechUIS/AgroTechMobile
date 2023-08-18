import 'package:agrotech/common_utilities/widgets/mini_option_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObreroOptions extends ConsumerWidget {
  const ObreroOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SubtitleWidget('Mis actividades:'),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: const [
              MiniOptionWidget(
                title: 'Actividades asignadas',
                iconRoute: 'assets/lista.svg',
                goPage: GestionPersonalPage(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
