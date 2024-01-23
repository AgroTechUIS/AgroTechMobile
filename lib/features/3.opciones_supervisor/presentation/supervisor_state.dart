// coverage:ignore-file
import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/bill_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/financial_report_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/today_report_model.dart';

class SupervisorState {
  final List<CropModel> cultivos;
  final List<CropModel> filterCultivos;
  final List<ActivityCropModel> actividades;
  final List<ActivityCropModel> filterActivities;
  final List<BillModel> ingresos;
  final List<BillModel> egresos;
  final List<BillModel> ingresosCrop;
  final List<BillModel> egresosCrop;
  final List<BillModel> filterIngresos;
  final List<BillModel> filterEgresos;
  final List<BillModel> filterHistory;
  final CropModel? selectedCrop;
  final DayReportModel? informeDiario;
  final FinancialReportModel? financialReport;
  final FinancialReportModel? reportCrop;
  final DateTime? dateFilterReport;

  SupervisorState(
      {this.cultivos = const [],
      this.filterCultivos = const [],
      this.actividades = const [],
      this.filterActivities = const [],
      this.ingresos = const [],
      this.egresos = const [],
      this.ingresosCrop = const [],
      this.egresosCrop = const [],
      this.filterIngresos = const [],
      this.filterEgresos = const [],
      this.filterHistory = const [],
      this.selectedCrop,
      this.informeDiario,
      this.financialReport,
      this.dateFilterReport,
      this.reportCrop});

  SupervisorState copyWith({
    List<CropModel>? cultivos,
    List<CropModel>? filterCultivos,
    List<ActivityCropModel>? actividades,
    List<ActivityCropModel>? filterActivities,
    List<BillModel>? ingresos,
    List<BillModel>? egresos,
    List<BillModel>? ingresosCrop,
    List<BillModel>? egresosCrop,
    List<BillModel>? filterIngresos,
    List<BillModel>? filterEgresos,
    List<BillModel>? filterHistory,
    CropModel? selectedCrop,
    DayReportModel? informeDiario,
    FinancialReportModel? financialReport,
    DateTime? dateFilterReport,
    FinancialReportModel? reportCrop,
  }) {
    return SupervisorState(
      cultivos: cultivos ?? this.cultivos,
      filterCultivos: filterCultivos ?? this.filterCultivos,
      actividades: actividades ?? this.actividades,
      filterActivities: filterActivities ?? this.filterActivities,
      ingresos: ingresos ?? this.ingresos,
      egresos: egresos ?? this.egresos,
      ingresosCrop: ingresosCrop ?? this.ingresosCrop,
      egresosCrop: egresosCrop ?? this.egresosCrop,
      filterIngresos: filterIngresos ?? this.filterIngresos,
      filterEgresos: filterEgresos ?? this.filterEgresos,
      filterHistory: filterHistory ?? this.filterHistory,
      selectedCrop: selectedCrop ?? this.selectedCrop,
      informeDiario: informeDiario ?? this.informeDiario,
      financialReport: financialReport ?? this.financialReport,
      reportCrop: reportCrop ?? this.reportCrop,
      dateFilterReport: dateFilterReport ?? this.dateFilterReport,
    );
  }
}
