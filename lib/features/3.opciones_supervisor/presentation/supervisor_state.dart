import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/bill_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/today_report_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/worker_model.dart';

class SupervisorState {
  final List<CropModel> cultivos;
  final List<ActivityCropModel> actividades;
  final List<BillModel> ingresos;
  final List<BillModel> egresos;
  final List<PointChartModel> graphicToday;
  final int ventasHoy;
  final int comprasHoy;
  final double ganaciasHoy;
  final double gastosHoy;
  final TodayReportModel? informeDiario;

  SupervisorState({
    this.cultivos = const [],
    this.actividades = const [],
    this.ingresos = const [],
    this.egresos = const [],
    this.graphicToday = const [],
    this.comprasHoy = 0,
    this.ventasHoy = 0,
    this.ganaciasHoy = 0,
    this.gastosHoy = 0,
    this.informeDiario,
  });

  SupervisorState copyWith({
    List<CropModel>? cultivos,
    List<ActivityCropModel>? actividades,
    List<BillModel>? ingresos,
    List<BillModel>? egresos,
    List<PointChartModel>? graphicToday,
    int? ventasHoy,
    int? comprasHoy,
    double? ganaciasHoy,
    double? gastosHoy,
    TodayReportModel? informeDiario,
  }) {
    return SupervisorState(
      cultivos: cultivos ?? this.cultivos,
      actividades: actividades ?? this.actividades,
      ingresos: ingresos ?? this.ingresos,
      egresos: egresos ?? this.egresos,
      graphicToday: graphicToday ?? this.graphicToday,
      ventasHoy: ventasHoy ?? this.ventasHoy,
      comprasHoy: comprasHoy ?? this.comprasHoy,
      ganaciasHoy: ganaciasHoy ?? this.ganaciasHoy,
      gastosHoy: gastosHoy ?? this.gastosHoy,
      informeDiario: informeDiario ?? this.informeDiario,
    );
  }
}
