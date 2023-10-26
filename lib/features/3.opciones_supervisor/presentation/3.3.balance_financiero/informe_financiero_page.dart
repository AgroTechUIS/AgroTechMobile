import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/config/network_images.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';
import 'package:agrotech/common_utilities/widgets/bar_chart_widget.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/infobox_wiget.dart';
import 'package:agrotech/common_utilities/widgets/section_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformeFinancieroPage extends ConsumerWidget {
  const InformeFinancieroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stateReport = ref.watch(balanceFinanciero);

    Color colorIncome = colors.white;
    Color textColor = colors.green3;
    Color backgroundInfoBox = colors.infoBox;

    return stateReport.when(
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
          body: SingleChildScrollView(
              child: BackgroundBodyWidget(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const HeaderPageWidget('Informe financiero'),
                SectionWidget(children: [
                  const SubtitleWidget('Finanzas:'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoBox(
                        title: 'Ventas totales:',
                        value: '${data.ventasTotales}',
                        backgroundColor: backgroundInfoBox,
                        textColorFirst: textColor,
                        textColorSecond: colorIncome,
                      ),
                      InfoBox(
                        title: 'Ganancias totales:',
                        value: '${data.ganaciaTotal}',
                        backgroundColor: backgroundInfoBox,
                        textColorFirst: textColor,
                        textColorSecond: colorIncome,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InfoBox(
                        title: 'Compras:',
                        value: '${data.comprasTotales}',
                        backgroundColor: backgroundInfoBox,
                        textColorFirst: textColor,
                        textColorSecond: colorIncome,
                      ),
                      InfoBox(
                        title: 'Gastos:',
                        value: '${data.gastoTotal}',
                        backgroundColor: backgroundInfoBox,
                        textColorFirst: textColor,
                        textColorSecond: colorIncome,
                      ),
                    ],
                  ),
                  BarChartWidget(
                    chartType: ChartType.balance,
                    listPoints: data.historicalGraph,
                    title: 'Histórico Ventas vs gastos',
                  ),
                  BarChartWidget(
                    chartType: ChartType.utilidad,
                    listPoints: data.historicalGraph,
                    title: 'Histórico utilidad',
                  ),
                ]),
              ],
            ),
          )),
        );
      },
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
