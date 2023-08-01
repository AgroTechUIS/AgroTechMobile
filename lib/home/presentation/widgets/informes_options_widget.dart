import 'package:agrotech/gestion_informes/presentation/Informe_diario_page.dart';
import 'package:agrotech/gestion_informes/presentation/informe_cultivos_page.dart';
import 'package:agrotech/gestion_informes/presentation/informe_financiero_page.dart';
import 'package:agrotech/gestion_informes/presentation/informe_historico_page.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/mini_option_widget.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/subtitleWidget.dart';
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
