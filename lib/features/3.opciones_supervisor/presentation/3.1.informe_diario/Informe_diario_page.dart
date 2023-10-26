import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/bar_chart_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/infobox_wiget.dart';
import 'package:agrotech/common_utilities/widgets/progress_bar_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/common_utilities/widgets/title_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformeDiarioPage extends ConsumerWidget {
  const InformeDiarioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stateSup = ref.watch(informeDiario);

    return stateSup.when(
      data: (data) {
        if ((data.error ?? '').isNotEmpty) {
          return const ErrorScreen();
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
                        const SubtitleWidget('Finanzas:'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InfoBox(
                              title: 'Ventas:',
                              value: '${data.ventaTotal}',
                            ),
                            InfoBox(
                              title: 'Ganancias:',
                              value: '${data.ganaciaTotal.toInt()}',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InfoBox(
                              title: 'Compras:',
                              value: '${data.compraTotal}',
                            ),
                            InfoBox(
                              title: 'Gastos:',
                              value: '${data.gastoTotal.toInt()}',
                            ),
                          ],
                        ),
                        BarChartWidget(
                          chartType: ChartType.hora,
                          listPoints: data.grafica.sublist(0, 12),
                          title: 'Ventas vs gastos AM',
                        ),
                        BarChartWidget(
                          chartType: ChartType.hora,
                          listPoints: data.grafica.sublist(12),
                          title: 'Ventas vs gastos PM',
                        ),
                      ],
                    ),
                    SectionWidget(
                      children: [
                        const SubtitleWidget('Actividades:'),
                        Row(
                          children: [
                            InfoBox(
                              title: 'Labranzas:',
                              value: '${data.labranzas}',
                            ),
                            InfoBox(
                              title: 'Siembras:',
                              value: '${data.siembras}',
                            ),
                            InfoBox(
                              title: 'Riegos:',
                              value: '${data.riegos}',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InfoBox(
                              title: 'Podas:',
                              value: '${data.podas}',
                            ),
                            InfoBox(
                              title: 'Cosechas:',
                              value: '${data.cosechas}',
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
                    ),
                  ],
                ),
              ),
            ));
      },
      error: (error, stackTrace) => const ErrorScreen(),
      loading: () => const LoadingListWidget(),
    );
  }
}
