import 'package:agrotech/gestion_informes/presentation/widgets/mini_option_widget.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/subtitleWidget.dart';
import 'package:agrotech/gestion_personal/gestion_personal_page.dart';
import 'package:flutter/material.dart';

class ObreroOptions extends StatelessWidget {
  const ObreroOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
