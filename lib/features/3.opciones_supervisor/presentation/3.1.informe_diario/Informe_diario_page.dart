// ignore_for_file: file_names

import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/tools.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/bar_chart_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/common_utilities/widgets/filter_one_date.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/infobox_wiget.dart';
import 'package:agrotech/common_utilities/widgets/progress_bar_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/common_utilities/widgets/title_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/loading_boxWidget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformeDiarioPage extends ConsumerWidget {
  const InformeDiarioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loadState = ref.watch(informeDiario);
    var state = ref.watch(supervisorController);
    var controller = ref.read(supervisorController.notifier);

    if (loadState.hasError) {
      return ErrorScreen(connectionError: loadState.asError.toString());
    }

    return Scaffold(
      backgroundColor: colors.white,
      appBar: AppBar(
        title: const Text('Informe Agro Tech'),
        centerTitle: true,
        backgroundColor: colors.green3,
      ),
      body: BackgroundBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const HeaderPageWidget('Informe diario'),
              SectionWidget(
                children: [
                  FilterOneDate(
                    onSelect: (date) => controller.filterDateDailyReport(date),
                  ),
                  loadState.when(
                    data: (date) {
                      var dataReport = state.informeDiario;
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          const SubtitleWidget('Finanzas:'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InfoBox(
                                title: 'Ventas:',
                                value: '${dataReport!.ventaTotal}',
                              ),
                              InfoBox(
                                title: 'Ganancias:',
                                value: '\$ ${formatNumber(dataReport.ganaciaTotal)}',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InfoBox(
                                title: 'Compras:',
                                value: '${dataReport.compraTotal}',
                              ),
                              InfoBox(
                                title: 'Gastos:',
                                value: '\$ ${formatNumber(dataReport.gastoTotal)}',
                              ),
                            ],
                          ),
                          TableResumeWidget(
                            title: 'Ingresos',
                            titles: [
                              'Ventas Agromarket:&\$${formatNumber(dataReport.gastoTotal)}',
                              'Otras ventas:&\$0',
                            ],
                          ),
                          TableResumeWidget(
                            title: 'Egresos',
                            titles: [
                              'Labranzas:&\$${formatNumber(dataReport.costolabranzas)}',
                              'Siembras:&\$${formatNumber(dataReport.costoSiembras)}',
                              'Riegos:&\$${formatNumber(dataReport.costoRiegos)}',
                              'Podas:&\$${formatNumber(dataReport.costoPodas)}',
                              'Cosechas:&\$${formatNumber(dataReport.costoCosechas)}',
                              'Insumos:&\$0',
                            ],
                          ),
                          const SubtitleWidget('Graficas:'),
                          BarChartWidget(
                            chartType: ChartType.hora,
                            listPoints: dataReport.grafica.sublist(0, 12),
                            title: 'Ventas vs gastos AM',
                          ),
                          BarChartWidget(
                            chartType: ChartType.hora,
                            listPoints: dataReport.grafica.sublist(12),
                            title: 'Ventas vs gastos PM',
                          ),
                          const SubtitleWidget('Actividades:'),
                          Row(
                            children: [
                              InfoBox(
                                title: 'Labranzas:',
                                value: '${dataReport.labranzas}',
                              ),
                              InfoBox(
                                title: 'Siembras:',
                                value: '${dataReport.siembras}',
                              ),
                              InfoBox(
                                title: 'Riegos:',
                                value: '${dataReport.riegos}',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InfoBox(
                                title: 'Podas:',
                                value: '${dataReport.podas}',
                              ),
                              InfoBox(
                                title: 'Cosechas:',
                                value: '${dataReport.cosechas}',
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  TitleWidget('Progreso en actividades'),
                                  ProgressBarWidget('Labranzas:'),
                                  ProgressBarWidget('Siembras:'),
                                  ProgressBarWidget('Riegos:'),
                                  ProgressBarWidget('Podas:'),
                                  ProgressBarWidget('Cosechas:'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) => const SizedBox(),
                    loading: () => LoadingBoxWidget(
                      child: Container(
                        width: double.infinity,
                        color: colors.white,
                        child: Column(
                          children: const [SizedBox(height: 1000)],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TableResumeWidget extends StatelessWidget {
  const TableResumeWidget({
    super.key,
    required this.title,
    required this.titles,
  });

  final String title;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      //padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: colors.green3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleWidget(
                  title,
                  textColor: colors.white,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                for (var i = 0; i < titles.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 190,
                        child: Text(
                          titles[i].split('&').first,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                        child: Text(
                          titles[i].split('&').last,
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
