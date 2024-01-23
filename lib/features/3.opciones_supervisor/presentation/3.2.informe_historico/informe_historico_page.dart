import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/filter_by_text_date_widget.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/loading_boxWidget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/3.2.informe_historico/widgets/history_card_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformeHistoricoPage extends ConsumerWidget {
  const InformeHistoricoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loadState = ref.watch(informeHistorico);
    var controller = ref.read(supervisorController.notifier);
    var state = ref.watch(supervisorController);

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
                addWidget: FilterByTextDateWidget(
                  onSearch: (d1, d2, value) => controller.filterHistory(d1, d2, value),
                ),
                children: [
                  loadState.when(
                    data: (data) {
                      return Column(
                        children: state.filterHistory.map((factura) {
                          //Facturas de pagos
                          switch (factura.tipo) {
                            case 'factura-obrero':
                              var actividad = factura.actividadObrero;
                              return HistoryCardWidget(
                                title: '- \$${factura.total!.toInt()}',
                                subtitle: '${actividad!.nombre}  -  N°${actividad.id}',
                                content: [
                                  'Factura: ${factura.id}',
                                  'Encargado: ${actividad.obrero}',
                                  'Fecha: ${factura.fecha}',
                                ],
                                subtitleColor: colors.orange,
                              );
                            case 'compra-cliente':
                              return HistoryCardWidget(
                                title: '+ \$${factura.total!.toInt()}',
                                subtitle: 'Venta  -  N°${factura.id}',
                                content: [
                                  'Factura: ${factura.id}',
                                  'Fecha: ${factura.fecha}',
                                ],
                                subtitleColor: colors.green3,
                              );
                            case 'venta-proveedor':
                              return HistoryCardWidget(
                                title: '- \$${factura.total!.toInt()}',
                                subtitle: 'Pago  -  N°${factura.id}',
                                content: [
                                  'Factura: ${factura.id}',
                                  'Fecha: ${factura.fecha}',
                                ],
                                subtitleColor: colors.orange,
                              );

                            default:
                              return const SizedBox();
                          }
                        }).toList(),
                      );
                    },
                    error: (error, stackTrace) => const SizedBox(),
                    loading: () => Column(
                      children: List.generate(3, (index) {
                        return LoadingBoxWidget(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            height: 130,
                          ),
                        );
                      }),
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
