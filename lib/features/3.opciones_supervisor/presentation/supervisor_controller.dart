import 'dart:math';

import 'package:agrotech/common_utilities/models/response_model.dart';
import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:agrotech/features/3.opciones_supervisor/data/List_crops_data_source.dart';
import 'package:agrotech/features/3.opciones_supervisor/data/bills_data_source.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_response_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/bill_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/bills_response%20model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/company_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crops_response_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/new_activity_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/use_cases/bills_use_case.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/use_cases/list_crops_use_case.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/financial_report_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/today_report_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SupervisorController extends StateNotifier<SupervisorState> {
  SupervisorController(
    this.listCropsUseCase,
    this.billsUseCase,
    this.idEmpresa,
  ) : super(SupervisorState()) {
    loadCrops();
  }

  // Use cases
  final CropsUseCaseImpl listCropsUseCase;
  final BillsUseCaseImpl billsUseCase;
  final int idEmpresa;

  Future<CropsResponseModel> loadCrops() async {
    var resp = await listCropsUseCase.loadCrops(companyModel: CompanyModel(idEmpresa: idEmpresa));
    state = state.copyWith(cultivos: resp.cultivos);
    return resp;
  }

  Future<ActivityCropsResponseModel> loadActivitiesCrop({required CropModel cropModel}) async {
    var resp = await listCropsUseCase.loadActivitiesCrop(cropModel: cropModel);
    state = state.copyWith(actividades: resp.actividades);
    return resp;
  }

  Future<BillsResponseModel> loadBillsIncome() async {
    var resp = await billsUseCase.loadBillsClient(companyModel: CompanyModel(idEmpresa: idEmpresa));
    state = state.copyWith(ingresos: resp.facturas);
    return resp;
  }

  Future<BillsResponseModel> loadBillsExpenses() async {
    var respSuplier = await billsUseCase.loadBillsSupplier(companyModel: CompanyModel(idEmpresa: idEmpresa));
    var respActivities = await billsUseCase.loadBillsActivities(companyModel: CompanyModel(idEmpresa: idEmpresa));
    var resp = (respSuplier.facturas ?? []) + (respActivities.facturas ?? []);
    state = state.copyWith(egresos: resp);
    return BillsResponseModel(
      idEmpresa: respSuplier.idEmpresa,
      facturas: resp,
      error: respSuplier.error ?? respActivities.error ?? '',
    );
  }

  Future<TodayReportModel> todayGraphic() async {
    var ingresos = await loadBillsIncome();
    var egresos = await loadBillsExpenses();

    List<BillModel> ingresosHoy = billsToday(state.ingresos);
    List<BillModel> egresosHoy = billsToday(state.egresos);
    var points = convertToPointsHour(ingresosHoy, egresosHoy);
    var gananciasHoy = totalBills(ingresosHoy);
    var gastosHoy = totalBills(egresosHoy);

    return TodayReportModel(
      grafica: points,
      ventaTotal: ingresosHoy.length,
      compraTotal: egresosHoy.length,
      ganaciaTotal: gananciasHoy,
      gastoTotal: gastosHoy,
      labranzas: searchActivity(egresosHoy, 'Labranza').length,
      siembras: searchActivity(egresosHoy, 'Siembra').length,
      riegos: searchActivity(egresosHoy, 'Riego').length,
      podas: searchActivity(egresosHoy, 'Poda').length,
      cosechas: searchActivity(egresosHoy, 'Cosecha').length,
      error: ingresos.error ?? egresos.error ?? '',
    );
  }

  bool sameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  List<BillModel> searchActivity(List<BillModel> facturas, String activity) {
    List<BillModel> labranzas = facturas.where((e) {
      if (e.actividadObrero != null) {
        if (e.actividadObrero!.nombre == activity) {
          return true;
        }
      }
      return false;
    }).toList();
    return labranzas;
  }

  List<BillModel> billsToday(List<BillModel> listBills) {
    var fechaFiltro = DateTime.now();
    return listBills.where((ingreso) {
      return sameDate(ingreso.fecha!, fechaFiltro);
    }).toList();
  }

  double totalBills(List<BillModel> ingresosHoy) {
    return ingresosHoy.fold(0.0, (a, b) => a + (b.total ?? 0.0));
  }

  List<PointChartModel> convertToPointsHour(List<BillModel> facturasIngresos, List<BillModel> facturasEgresos) {
    List<PointChartModel> points = [];
    for (int i = 1; i <= 24; i++) {
      PointChartModel point;
      double totalIngresos =
          facturasIngresos.where((factura) => factura.fecha!.hour == i).fold(0, (a, b) => a + (b.total ?? 0) / 1000000);
      double totalEgresos =
          facturasEgresos.where((factura) => factura.fecha!.hour == i).fold(0, (a, b) => a + (b.total ?? 0) / 1000000);
      point = PointChartModel(x: i, y: totalIngresos, z: totalEgresos);

      points.add(point);
    }
    return points;
  }

  Future<FinancialReportModel> getFinancialReport() async {
    var ingresos = await loadBillsIncome();
    var egresos = await loadBillsExpenses();

    var ganaciaTotal = totalBills(ingresos.facturas ?? []);
    var gastoTotal = totalBills(egresos.facturas ?? []);

    List<PointChartModel> historicalGraph = convertToPointsYear(state.ingresos, state.egresos);

    return FinancialReportModel(
      ventasTotales: state.ingresos.length,
      comprasTotales: state.egresos.length,
      ganaciaTotal: ganaciaTotal,
      gastoTotal: gastoTotal,
      historicalGraph: historicalGraph,
      error: ingresos.error ?? egresos.error ?? '',
    );
  }

  List<PointChartModel> convertToPointsYear(List<BillModel> facturasIngresos, List<BillModel> facturasEgresos) {
    List<PointChartModel> points = [];

    for (int i = 2010; i <= DateTime.now().year; i++) {
      PointChartModel point;
      double totalIngresos =
          facturasIngresos.where((factura) => factura.fecha!.year == i).fold(0, (a, b) => a + (b.total ?? 0) / 1000000);
      double totalEgresos =
          facturasEgresos.where((factura) => factura.fecha!.year == i).fold(0, (a, b) => a + (b.total ?? 0) / 1000000);
      point = PointChartModel(x: i, y: totalIngresos, z: totalEgresos);
      points.add(point);
    }
    return points;
  }

  Future<BillsResponseModel> getHistoryReport() async {
    var ingresos = await loadBillsIncome();
    var egresos = await loadBillsExpenses();
    var history = state.egresos + state.ingresos;
    history.sort((a, b) => a.fecha!.compareTo(b.fecha!));
    return BillsResponseModel(
      idEmpresa: 0,
      facturas: history,
      error: ingresos.error ?? egresos.error ?? '',
    );
  }

  Future<BillsResponseModel> loadBillsIncomeCrop() async {
    var resp = await billsUseCase.loadBillsClientCrop(companyModel: CompanyModel(idEmpresa: idEmpresa));
    return resp;
  }

  Future<BillsResponseModel> loadBillsExpensesCrop() async {
    var respSuplier = await billsUseCase.loadBillsClientCrop(companyModel: CompanyModel(idEmpresa: idEmpresa));
    var respActivities = await billsUseCase.loadBillsActivitiesCrop(companyModel: CompanyModel(idEmpresa: idEmpresa));
    var resp = (respSuplier.facturas ?? []) + (respActivities.facturas ?? []);
    state = state.copyWith(egresos: resp);
    return BillsResponseModel(
      idEmpresa: respSuplier.idEmpresa,
      facturas: resp,
      error: respSuplier.error ?? respActivities.error ?? '',
    );
  }

  Future<FinancialReportModel> getFinancialCropReport() async {
    var ingresos = await loadBillsIncome();
    var egresos = await loadBillsExpenses();

    var ganaciaTotal = totalBills(ingresos.facturas ?? []);
    var gastoTotal = totalBills(egresos.facturas ?? []);

    List<PointChartModel> historicalGraph = convertToPointsYear(state.ingresos, state.egresos);

    return FinancialReportModel(
      ventasTotales: state.ingresos.length,
      comprasTotales: state.egresos.length,
      ganaciaTotal: ganaciaTotal,
      gastoTotal: gastoTotal,
      historicalGraph: historicalGraph,
    );
  }

  Future<ResponseModel> loadListWorkers() async {
    var resp = await listCropsUseCase.loadListWorkers(idEmpresa: idEmpresa.toString());
    return resp;
  }

  Future<bool> newActivity(NewActivityModel newActivity) async {
    var resp = await listCropsUseCase.newActivity(newActivity: newActivity);
    return resp.response ?? false;
  }
}

final supervisorController = StateNotifierProvider<SupervisorController, SupervisorState>(
  (ref) => SupervisorController(
    CropsUseCaseImpl(CropsDataSource()),
    BillsUseCaseImpl(BillsDataSource()),
    ref.watch(loginController).idEmpresa,
  ),
);

final asignacionCultivos = FutureProvider.autoDispose<CropsResponseModel>((ref) async {
  return ref.read(supervisorController.notifier).loadCrops();
});

final gestionIngresos = FutureProvider.autoDispose<BillsResponseModel>((ref) async {
  return ref.read(supervisorController.notifier).loadBillsIncome();
});

final gestionEgresos = FutureProvider.autoDispose<BillsResponseModel>((ref) async {
  return ref.read(supervisorController.notifier).loadBillsExpenses();
});

final informeDiario = FutureProvider.autoDispose<TodayReportModel>((ref) async {
  return ref.read(supervisorController.notifier).todayGraphic();
});

final balanceFinanciero = FutureProvider.autoDispose<FinancialReportModel>((ref) async {
  return ref.read(supervisorController.notifier).getFinancialReport();
});

final informeHistorico = FutureProvider.autoDispose<BillsResponseModel>((ref) async {
  return ref.read(supervisorController.notifier).getHistoryReport();
});

final listObreros = FutureProvider.autoDispose<ResponseModel>((ref) async {
  return ref.read(supervisorController.notifier).loadListWorkers();
});
