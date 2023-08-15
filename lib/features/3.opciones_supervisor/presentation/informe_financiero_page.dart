import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/config/network_images.dart';
import 'package:agrotech/features/3.opciones_supervisor/models/point_chart_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/bar_chart_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/header_page_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/infobox_wiget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/section_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/subtitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformeFinancieroPage extends ConsumerWidget {
  const InformeFinancieroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenSize = MediaQuery.of(context).size;

    Color colorIncome = colors.white;
    Color textColor = colors.green3;
    Color backgroundInfoBox = colors.black;

    String ventas = '30000';
    String ganacias = '\$500.000.000';
    String compras = '1300';
    String gastos = '\$120.000.000';

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

    return Scaffold(
      backgroundColor: colors.backgroundwhite,
      appBar: AppBar(
        title: const Text('Informe Agro Tech'),
        centerTitle: true,
        backgroundColor: colors.appbar,
      ),
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              netImages.background,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const HeaderPageWidget('Informe financiero'),
            //const GenericDivider(),
            SectionWidget(children: [
              const SubtitleWidget('Finanzas:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoBox(
                    screenSize: screenSize,
                    title: 'Ventas totales:',
                    value: ventas,
                    backgroundColor: backgroundInfoBox,
                    textColorFirst: textColor,
                    textColorSecond: colorIncome,
                  ),
                  InfoBox(
                    screenSize: screenSize,
                    title: 'Ganancias totales:',
                    value: ganacias,
                    backgroundColor: backgroundInfoBox,
                    textColorFirst: textColor,
                    textColorSecond: colorIncome,
                  ),
                ],
              ),
              Row(
                children: [
                  InfoBox(
                    screenSize: screenSize,
                    title: 'Compras:',
                    value: compras,
                    backgroundColor: backgroundInfoBox,
                    textColorFirst: textColor,
                    textColorSecond: colorIncome,
                  ),
                  InfoBox(
                    screenSize: screenSize,
                    title: 'Gastos:',
                    value: gastos,
                    backgroundColor: backgroundInfoBox,
                    textColorFirst: textColor,
                    textColorSecond: colorIncome,
                  ),
                ],
              ),
              BarChartWidget(
                chartType: ChartType.balance,
                listPoints: balance,
                title: 'Histórico Ventas vs gastos',
              ),
              BarChartWidget(
                chartType: ChartType.utilidad,
                listPoints: balance,
                title: 'Histórico utilidad',
              ),
            ])
          ],
        ),
      )),
    );
  }
}
