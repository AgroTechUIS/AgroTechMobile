import 'package:agrotech/common_utilities/widgets/mini_option_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_page.dart';
import 'package:agrotech/features/4.cultivos/presentation/crop_page.dart';
import 'package:agrotech/features/5.cuidados/presentation/cuidado_page.dart';
import 'package:agrotech/features/5.tratamientos/presentation/treatment_page.dart';
import 'package:agrotech/features/5.variables/presentation/variable_page.dart';
import 'package:agrotech/features/6.medidas/presentation/measure_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GestorOptions extends ConsumerWidget {
  const GestorOptions({
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
            children: [
              MiniOptionWidget(
                title: 'Gestión agrícola',
                iconRoute: 'assets/agronomy.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CropPage()),
                  );
                },
              ),
              MiniOptionWidget(
                title: 'Tratamientos',
                iconRoute: 'assets/agronomy.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TratamientosPage()),
                  );
                },
                //goPage: TratamientosPage(),
              ),
              MiniOptionWidget(
                title: 'Variables',
                iconRoute: 'assets/agronomy.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VariablesPage()),
                  );
                },
                //goPage: VariablesPage(),
              ),
              MiniOptionWidget(
                title: 'Cuidados',
                iconRoute: 'assets/agronomy.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CuidadosPage()),
                  );
                },
                //goPage: CuidadosPage(),
              ),
              MiniOptionWidget(
                title: 'Medidas',
                iconRoute: 'assets/agronomy.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VariablesTPage()),
                  );
                },
                //goPage: VariablesTPage(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
