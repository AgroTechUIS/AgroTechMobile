import 'package:agrotech/gestion_financiera/gestion_financiera_page.dart';
import 'package:agrotech/gestion_informes/presentation/Informe_diario_page.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/mini_option_widget.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/subtitleWidget.dart';
import 'package:agrotech/home/presentation/widgets/informes_options_widget.dart';
import 'package:flutter/material.dart';

class FinancieroOptions extends StatelessWidget {
  const FinancieroOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              MiniOptionWidget(
                title: 'Gestion facturas',
                iconRoute: 'assets/invoice.svg',
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