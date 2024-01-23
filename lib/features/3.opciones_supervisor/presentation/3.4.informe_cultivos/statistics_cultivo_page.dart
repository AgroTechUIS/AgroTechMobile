import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';
import 'package:agrotech/common_utilities/widgets/bar_chart_widget.dart';
import 'package:agrotech/common_utilities/widgets/infobox_wiget.dart';
import 'package:agrotech/common_utilities/widgets/section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StadisticCultivoPage extends ConsumerWidget {
  const StadisticCultivoPage({
    super.key,
    required this.idCultivo,
  });

  final String idCultivo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PointChartModel> balance = [
      PointChartModel(x: 2012, y: 16, z: 1),
      PointChartModel(x: 2013, y: 13, z: 2),
      PointChartModel(x: 2014, y: 12, z: 3),
      PointChartModel(x: 2015, y: 10, z: 4),
      PointChartModel(x: 2016, y: 9, z: 5),
      PointChartModel(x: 2017, y: 8, z: 6),
      PointChartModel(x: 2018, y: 7, z: 7),
      PointChartModel(x: 2019, y: 7, z: 8),
      PointChartModel(x: 2020, y: 10, z: 7),
      PointChartModel(x: 2021, y: 12, z: 6),
      PointChartModel(x: 2022, y: 13, z: 5),
      PointChartModel(x: 2023, y: 15, z: 4),
    ];

    String ganacias = '\$5.000.000';
    String gastos = '\$1.200.000';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe Agro Tech'),
        centerTitle: true,
        backgroundColor: colors.green3,
      ),
      body: BackgroundBodyWidget(
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Informe cultivo id $idCultivo',
                style: const TextStyle(fontSize: 25),
              ),
            ),
            SectionWidget(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoBox(
                    title: 'Gastos:',
                    value: gastos,
                    backgroundColor: colors.infoBox,
                    textColorFirst: colors.green,
                    textColorSecond: colors.white,
                  ),
                  InfoBox(
                    title: 'Ganancias:',
                    value: ganacias,
                    backgroundColor: colors.infoBox,
                    textColorFirst: colors.green,
                    textColorSecond: colors.white,
                  ),
                ],
              ),
              BarChartWidget(
                chartType: ChartType.hora,
                listPoints: balance,
                title: 'Ventas vs gastos',
              ),
              BarChartWidget(
                chartType: ChartType.utilidad,
                listPoints: balance,
                title: 'Utilidad',
              ),
              BarChartWidget(
                chartType: ChartType.utilidad,
                listPoints: balance,
                title: 'Producción',
              ),
            ]),
          ],
        )),
      ),
    );
  }
}
