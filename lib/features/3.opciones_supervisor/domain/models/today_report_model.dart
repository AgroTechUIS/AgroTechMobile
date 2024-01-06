import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';

class DayReportModel {
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
  final double costolabranzas;
  final double costoSiembras;
  final double costoRiegos;
  final double costoPodas;
  final double costoCosechas;
  String? error;

  DayReportModel({
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
    required this.costolabranzas,
    required this.costoSiembras,
    required this.costoRiegos,
    required this.costoPodas,
    required this.costoCosechas,
    this.error,
  });
}
