import 'package:agrotech/features/3.opciones_supervisor/presentation/3.3.balance_financiero/gestion_financiera_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/3.1.informe_diario/Informe_diario_page.dart';
import 'package:agrotech/common_utilities/widgets/mini_option_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/subtitleWidget.dart';
import 'package:agrotech/features/2.home/presentation/widgets/informes_options_widget.dart';
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
