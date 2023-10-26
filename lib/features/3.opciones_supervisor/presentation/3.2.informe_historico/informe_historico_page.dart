import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/3.2.informe_historico/widgets/history_card_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformeHistoricoPage extends ConsumerWidget {
  const InformeHistoricoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(informeHistorico);
    return state.when(
      data: (data) {
        if ((data.error ?? '').isNotEmpty) {
          return const ErrorScreen();
        }
        return Scaffold(
          backgroundColor: colors.backgroundwhite,
          appBar: AppBar(
            title: const Text('Informe Agro Tech'),
            centerTitle: true,
            backgroundColor: colors.appbar,
          ),
          body: BackgroundBodyWidget(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const HeaderPageWidget('Informe histórico'),
                SectionScrollWidget(
                  children: data.facturas!.map((factura) {
                    //Facturas de pagos
                    switch (factura.tipo) {
                      case 'factura-obrero':
                        var actividad = factura.actividadObrero;
                        return HistoryCardWidget(
                          title: '- \$${factura.total!.toInt()}',
                          subtitle: '${actividad!.nombre}  -  N°${actividad.id}',
                          content: [
                            'Factura: ${factura.numeroFactura}',
                            'Encargado: ${actividad.obrero}',
                            'Fecha: ${factura.fecha}',
                          ],
                          subtitleColor: Colors.red,
                        );
                      case 'compra-cliente':
                        return HistoryCardWidget(
                          title: '+ \$${factura.total!.toInt()}',
                          subtitle: 'Venta  -  N°${factura.idFactura}',
                          content: [
                            'Factura: ${factura.numeroFactura}',
                            'Fecha: ${factura.fecha}',
                          ],
                          subtitleColor: colors.green3,
                        );
                      case 'venta-proveedor':
                        return HistoryCardWidget(
                          title: '+ \$${factura.total!.toInt()}',
                          subtitle: 'Pago  -  N°${factura.idFactura}',
                          content: [
                            'Factura: ${factura.numeroFactura}',
                            'Fecha: ${factura.fecha}',
                          ],
                          subtitleColor: colors.green3,
                        );

                      default:
                        return const SizedBox();
                    }
                  }).toList(),
                )
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => const ErrorScreen(),
      loading: () => const LoadingListWidget(),
    );
  }
}
