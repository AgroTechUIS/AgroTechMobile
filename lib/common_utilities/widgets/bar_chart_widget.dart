import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/bar_chart_month.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';
import 'package:agrotech/common_utilities/widgets/bar_chart_hora.dart';
import 'package:agrotech/common_utilities/widgets/bar_chart_balance.dart';
import 'package:agrotech/common_utilities/widgets/bar_chart_utilidad.dart';
import 'package:agrotech/common_utilities/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final List<PointChartModel> listPoints;
  final ChartType chartType;
  final String title;

  const BarChartWidget({
    super.key,
    required this.listPoints,
    required this.chartType,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    switch (chartType) {
      case ChartType.hora:
        return BorderChartWidget(
          chart: BarChartHora(listPoints),
          title: title,
        );
      case ChartType.balance:
        return BorderChartWidget(
          chart: BarChartBalance(listPoints),
          title: title,
        );
      case ChartType.utilidad:
        return BorderChartWidget(
          chart: BarChartUtilidad(listPoints),
          title: title,
        );
      case ChartType.month:
        return BorderChartWidget(
          chart: BarChartMonth(listPoints),
          title: title,
        );
      default:
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: AspectRatio(
            aspectRatio: 1.6,
            child: BarChartHora(listPoints),
          ),
        );
    }
  }
}

enum ChartType {
  hora,
  balance,
  utilidad,
  month,
}

class BorderChartWidget extends StatelessWidget {
  const BorderChartWidget({
    Key? key,
    required this.title,
    required this.chart,
  }) : super(key: key);

  final Widget chart;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        decoration: BoxDecoration(
          color: colors.backgroudBarChart,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleWidget(
              title,
              textColor: colors.titleChart,
            ),
            const SizedBox(
              height: 20,
            ),
            AspectRatio(
              aspectRatio: 2.0,
              child: chart,
            ),
          ],
        ),
      ),
    );
  }
}
