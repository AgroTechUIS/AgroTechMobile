import 'package:agrotech/features/3.opciones_supervisor/presentation/Informe_diario_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/asignacion_cultivos/asignacion_cultivos_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/mini_option_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/subtitleWidget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/gestion_financiera_page.dart';
import 'package:agrotech/features/2.home/presentation/widgets/informes_options_widget.dart';
import 'package:flutter/material.dart';

class SupervisorOptions extends StatelessWidget {
  const SupervisorOptions({
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
        const SubtitleWidget('Gestion financiera:'),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: const [
              MiniOptionWidget(
                title: 'Gestion ingresos',
                iconRoute: 'assets/contract.svg',
                goPage: GestionFinancieraIngresos(),
              ),
              MiniOptionWidget(
                title: 'Gestion egresos',
                iconRoute: 'assets/egreso.svg',
                goPage: InformeDiarioPage(),
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