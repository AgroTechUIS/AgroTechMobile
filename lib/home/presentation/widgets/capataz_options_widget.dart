import 'package:agrotech/gestion_informes/presentation/asig_cultivos_page.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/mini_option_widget.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/subtitleWidget.dart';
import 'package:agrotech/home/presentation/widgets/informes_options_widget.dart';
import 'package:flutter/material.dart';

class CapatazOptions extends StatelessWidget {
  const CapatazOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubtitleWidget('Gestion productiva:'),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              MiniOptionWidget(
                title: 'Asignar cultivos',
                iconRoute: 'assets/cultivation.svg',
                goPage: AsigCultivoPage(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const InformesOptions(),
      ],
    );
  }
}
