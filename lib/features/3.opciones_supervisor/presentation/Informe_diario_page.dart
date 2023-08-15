import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/features/3.opciones_supervisor/models/actividad_cultivo.dart';
import 'package:agrotech/features/3.opciones_supervisor/models/point_chart_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/bar_chart_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/header_page_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/infobox_wiget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/progress_bar_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/section_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/subtitleWidget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformeDiarioPage extends ConsumerWidget {
  const InformeDiarioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenSize = MediaQuery.of(context).size;

    String ventas = '300';
    String ganacias = '\$5.000.000';
    String compras = '13';
    String gastos = '\$1.200.000';

    List<PointChartModel> balanceAM = [
      PointChartModel(x: 1, y: 16, z: 1),
      PointChartModel(x: 2, y: 10, z: 2),
      PointChartModel(x: 3, y: 14, z: 3),
      PointChartModel(x: 4, y: 15, z: 4),
      PointChartModel(x: 5, y: 13, z: 5),
      PointChartModel(x: 6, y: 14, z: 6),
      PointChartModel(x: 7, y: 10, z: 7),
      PointChartModel(x: 8, y: 15, z: 8),
      PointChartModel(x: 9, y: 10, z: 7),
      PointChartModel(x: 10, y: 16, z: 6),
      PointChartModel(x: 11, y: 10, z: 5),
      PointChartModel(x: 12, y: 15, z: 4),
    ];

    List<PointChartModel> balancePM = [
      PointChartModel(x: 13, y: 10, z: 3),
      PointChartModel(x: 14, y: 16, z: 3),
      PointChartModel(x: 15, y: 10, z: 3),
      PointChartModel(x: 16, y: 14, z: 3),
      PointChartModel(x: 17, y: 15, z: 3),
      PointChartModel(x: 18, y: 13, z: 3),
      PointChartModel(x: 19, y: 10, z: 3),
      PointChartModel(x: 18, y: 10, z: 3),
      PointChartModel(x: 21, y: 10, z: 3),
      PointChartModel(x: 22, y: 10, z: 3),
      PointChartModel(x: 23, y: 10, z: 3),
      PointChartModel(x: 24, y: 10, z: 3),
    ];

    final List<ActividadCultivoModel> labranzasList = [
      ActividadCultivoModel(123, 'Labranza', '20/05/2023', 'Maiz', 'Zona A', 'Finca del Sol', 100000, true, false),
      ActividadCultivoModel(124, 'Labranza', '20/05/2023', 'Mora', 'Zona B', 'El Paraíso Verde', 100000, true, true),
      ActividadCultivoModel(125, 'Labranza', '20/05/2023', 'Trigo', 'Zona A', 'Oasis Verde', 100000, false, true),
      ActividadCultivoModel(123, 'Siembra', '20/05/2023', 'Maiz', 'Zona A', 'Finca del Sol', 100000, true, false),
      ActividadCultivoModel(124, 'Siembra', '20/05/2023', 'Mora', 'Zona B', 'El Paraíso Verde', 100000, true, true),
      ActividadCultivoModel(125, 'Siembra', '20/05/2023', 'Trigo', 'Zona A', 'Oasis Verde', 100000, false, true),
      ActividadCultivoModel(123, 'Riegos', '20/05/2023', 'Maiz', 'Zona A', 'Finca del Sol', 100000, true, false),
      ActividadCultivoModel(124, 'Riegos', '20/05/2023', 'Mora', 'Zona B', 'El Paraíso Verde', 100000, true, true),
      ActividadCultivoModel(125, 'Riegos', '20/05/2023', 'Trigo', 'Zona A', 'Oasis Verde', 100000, false, true),
      ActividadCultivoModel(123, 'Podas', '20/05/2023', 'Maiz', 'Zona A', 'Finca del Sol', 100000, true, false),
      ActividadCultivoModel(124, 'Podas', '20/05/2023', 'Mora', 'Zona B', 'El Paraíso Verde', 100000, true, true),
      ActividadCultivoModel(125, 'Podas', '20/05/2023', 'Trigo', 'Zona A', 'Oasis Verde', 100000, false, true),
      ActividadCultivoModel(123, 'Cosechas', '20/05/2023', 'Maiz', 'Zona A', 'Finca del Sol', 100000, true, false),
      ActividadCultivoModel(124, 'Cosechas', '20/05/2023', 'Mora', 'Zona B', 'El Paraíso Verde', 100000, true, true),
      ActividadCultivoModel(125, 'Cosechas', '20/05/2023', 'Trigo', 'Zona A', 'Oasis Verde', 100000, false, true),
    ];

    return Scaffold(
      backgroundColor: colors.backgroundwhite,
      appBar: AppBar(
        title: const Text('Informe Agro Tech'),
        centerTitle: true,
        backgroundColor: colors.green3,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.freepik.com/free-vector/abstract-gray-stripes-background_1035-19089.jpg'),
            fit: BoxFit.fill,
          ),
        ),
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
                        screenSize: screenSize,
                        title: 'Ventas:',
                        value: ventas,
                      ),
                      InfoBox(
                        screenSize: screenSize,
                        title: 'Ganancias:',
                        value: ganacias,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InfoBox(
                        screenSize: screenSize,
                        title: 'Compras:',
                        value: compras,
                      ),
                      InfoBox(
                        screenSize: screenSize,
                        title: 'Gastos:',
                        value: gastos,
                      ),
                    ],
                  ),
                  BarChartWidget(
                    chartType: ChartType.hora,
                    listPoints: balanceAM,
                    title: 'Ventas vs gastos AM',
                  ),
                  BarChartWidget(
                    chartType: ChartType.hora,
                    listPoints: balancePM,
                    title: 'Ventas vs gastos PM',
                  ),
                ],
              ),
              //const GenericDivider(),

              SectionWidget(
                children: [
                  const SubtitleWidget('Actividades:'),
                  Row(
                    children: [
                      InfoBox(
                        screenSize: screenSize,
                        title: 'Labranzas:',
                        value: '9',
                      ),
                      InfoBox(
                        screenSize: screenSize,
                        title: 'Siembras:',
                        value: '1',
                      ),
                      InfoBox(
                        screenSize: screenSize,
                        title: 'Riegos:',
                        value: '9',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InfoBox(
                        screenSize: screenSize,
                        title: 'Podas:',
                        value: '1',
                      ),
                      InfoBox(
                        screenSize: screenSize,
                        title: 'Cosechas:',
                        value: '1',
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
      ),
    );
  }
}
