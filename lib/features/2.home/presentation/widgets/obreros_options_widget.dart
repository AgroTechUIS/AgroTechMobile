import 'package:agrotech/common_utilities/widgets/mini_option_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_page.dart';
import 'package:agrotech/features/4.cultivos/presentation/crop_page.dart';
import 'package:agrotech/features/5.cuidados/presentation/cuidado_page.dart';
import 'package:agrotech/features/5.plagas/presentation/pest_page.dart';
import 'package:agrotech/features/6.medidas/presentation/measure_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../5.tratamientos/presentation/treatment_page.dart';
import '../../../5.variables/presentation/variable_page.dart';

class ObreroOptions extends ConsumerWidget {
  const ObreroOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        SubtitleWidget('Mis actividades:'),
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              MiniOptionWidget(
                title: 'Actividades asignadas',
                iconRoute: 'assets/lista.svg',
                goPage: GestionPersonalPage(),
              ),
              MiniOptionWidget(
                title: 'Gestión agrícola',
                iconRoute: 'assets/agronomy.svg',
                goPage: PlagasPage(),
              ),
              MiniOptionWidget(
                title: 'Tratamientos',
                iconRoute: 'assets/agronomy.svg',
                goPage: TratamientosPage(),
              ),
              MiniOptionWidget(
                title: 'Variables',
                iconRoute: 'assets/agronomy.svg',
                goPage: VariablesPage(),
              ),
              MiniOptionWidget(
                title: 'Cuidados',
                iconRoute: 'assets/agronomy.svg',
                goPage: CuidadosPage(),
              ),
              MiniOptionWidget(
                title: 'Medidas',
                iconRoute: 'assets/agronomy.svg',
                goPage: VariablesTPage(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
