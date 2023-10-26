import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';

class TodayReportModel {
  List<PointChartModel> grafica;
  int ventaTotal;
  int compraTotal;
  double ganaciaTotal;
  double gastoTotal;
  int labranzas;
  int siembras;
  int riegos;
  int podas;
  int cosechas;
  String? error;

  TodayReportModel({
    required this.grafica,
    required this.ventaTotal,
    required this.compraTotal,
    required this.ganaciaTotal,
    required this.gastoTotal,
    required this.labranzas,
    required this.siembras,
    required this.riegos,
    required this.podas,
    required this.cosechas,
    this.error,
  });
}
