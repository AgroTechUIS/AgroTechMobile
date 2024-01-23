import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartMonth extends StatelessWidget {
  final List<PointChartModel> listPoints;

  const BarChartMonth(this.listPoints, {super.key});

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
  Widget bootomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromRGBO(43, 110, 110, 1),
      fontWeight: FontWeight.bold,
      fontSize: 11,
    );
    String text;

    if (value == 1) {
      text = 'ENE';
    } else if (value == 2) {
      text = 'FEB';
    } else if (value == 3) {
      text = 'MAR';
    } else if (value == 4) {
      text = 'ABR';
    } else if (value == 5) {
      text = 'MAY';
    } else if (value == 6) {
      text = 'JUN';
    } else if (value == 7) {
      text = 'JUL';
    } else if (value == 8) {
      text = 'AGO';
    } else if (value == 9) {
      text = 'SEP';
    } else if (value == 10) {
      text = 'OCT';
    } else if (value == 11) {
      text = 'NOV';
    } else if (value == 12) {
      text = 'DIC';
    } else {
      return Container();
    }

    return SideTitleWidget(
      angle: 1.1,
      axisSide: meta.axisSide,
      space: 10,
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
            getTitlesWidget: bootomTitles,
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
  LinearGradient get _barsGradientVentas => const LinearGradient(
        colors: [
          Colors.green,
          Color.fromRGBO(21, 177, 125, 0.992),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  LinearGradient get _barsGradientCompras => const LinearGradient(
        colors: [
          Colors.red,
          Color.fromRGBO(177, 128, 21, 0.988),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );
}

// leftTitles
Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
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
