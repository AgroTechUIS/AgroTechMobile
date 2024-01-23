import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartHora extends StatelessWidget {
  final List<PointChartModel> listPoints;

  const BarChartHora(this.listPoints, {super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  List<BarChartGroupData> get barGroups => listPoints
      .map(
        (e) => BarChartGroupData(
          x: e.x,
          barRods: [
            BarChartRodData(
              borderSide: BorderSide(width: 0),
              toY: e.y,
              gradient: _barsGradientVentas,
            ),
            BarChartRodData(
              toY: e.z,
              gradient: _barsGradientCompras,
            )
          ],
          showingTooltipIndicators: [],
        ),
      )
      .toList();

  // BarTouchData
  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 6,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Color.fromRGBO(43, 110, 110, 1),
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  // get Titles
  Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: colors.label,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;

    if (value < 13) {
      text = "${value.toInt()}am";
    } else {
      text = "${value.toInt() - 12}pm";
    }

    //text = "${value.toInt()}";

    return SideTitleWidget(
      angle: 0.7,
      axisSide: meta.axisSide,
      space: 10,
      child: Text(text, style: style),
    );
  }

  Widget getTitlesParcela(double value, TitleMeta meta) {
    var style = TextStyle(
      color: colors.label,
      fontWeight: FontWeight.bold,
      fontSize: 11,
    );
    String text;

    text = '$value';

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  // FlTitlesData
  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            interval: 1,
            getTitlesWidget: leftTitles,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  // FlBorderData
  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  // LinearGradient
  LinearGradient get _barsGradientVentas => LinearGradient(
        colors: [
          colors.green4,
          colors.green2,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  LinearGradient get _barsGradientCompras => LinearGradient(
        colors: [
          colors.orange,
          colors.orangelight,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );
}

// leftTitles
Widget leftTitles(double value, TitleMeta meta) {
  var style = TextStyle(
    color: colors.label,
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );
  String text;
  if (value == 0) {
    text = '0';
  } else if (value == 5) {
    text = '5M';
  } else if (value == 10) {
    text = '10M';
  } else if (value == 15) {
    text = '15M';
  } else if (value == 20) {
    text = '20M';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}
