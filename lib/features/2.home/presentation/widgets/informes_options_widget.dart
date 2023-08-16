import 'package:agrotech/features/3.opciones_supervisor/presentation/3.1.informe_diario/Informe_diario_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/3.4.informe_cultivos/informe_cultivos_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/informe_financiero_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/3.2.informe_historico/informe_historico_page.dart';
import 'package:agrotech/common_utilities/widgets/mini_option_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/subtitleWidget.dart';
import 'package:flutter/material.dart';

class InformesOptions extends StatelessWidget {
  const InformesOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubtitleWidget('Informes:'),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                MiniOptionWidget(
                  title: 'Informe \ndiario',
                  iconRoute: 'assets/bill.svg',
                  goPage: InformeDiarioPage(),
                ),
                MiniOptionWidget(
                  title: 'Informe histórico',
                  iconRoute: 'assets/file.svg',
                  goPage: InformeHistoricoPage(),
                ),
                MiniOptionWidget(
                  title: 'Balance financiero',
                  iconRoute: 'assets/profits.svg',
                  goPage: InformeFinancieroPage(),
                ),
                MiniOptionWidget(
                  title: 'Informe de cultivos',
                  iconRoute: 'assets/agronomy.svg',
                  goPage: InformeCultivosPage(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
