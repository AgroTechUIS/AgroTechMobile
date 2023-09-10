import 'package:agrotech/features/3.opciones_supervisor/models/point_chart_model.dart';

class FinancialReportModel {
  int ventasTotales;
  int comprasTotales;
  double ganaciaTotal;
  double gastoTotal;
  List<PointChartModel> historicalGraph;

  FinancialReportModel({
    required this.ventasTotales,
    required this.comprasTotales,
    required this.ganaciaTotal,
    required this.gastoTotal,
    required this.historicalGraph,
  });
}
