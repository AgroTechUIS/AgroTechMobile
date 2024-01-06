import 'package:agrotech/common_utilities/controllers/offline_controller.dart';
import 'package:agrotech/common_utilities/models/response_model.dart';
import 'package:agrotech/common_utilities/tools.dart';
import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:agrotech/features/3.opciones_supervisor/data/List_crops_data_source.dart';
import 'package:agrotech/features/3.opciones_supervisor/data/bills_data_source.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_response_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/bill_model.dart';
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
    this.online,
  ) : super(SupervisorState());

  // Use cases
  final CropsUseCaseImpl listCropsUseCase;
  final BillsUseCaseImpl billsUseCase;

  // Variables
  final int idEmpresa;
  final bool online;

  ///
  /// Administracion de cultivos
  ///

  // Cargar lista de cultivos en state
  Future<CropsResponseModel> loadCrops() async {
    CropsResponseModel resp = CropsResponseModel();
    resp = await listCropsUseCase.loadCrops(companyModel: CompanyModel(idEmpresa: idEmpresa), isOnline: online);
    if (resp.cultivos != null) {
      state = state.copyWith(cultivos: resp.cultivos, filterCultivos: resp.cultivos);
    } else {
      throw Exception(resp.error);
    }

    return resp;
  }

  // Filtrar cultivos
  List<CropModel> filterCrops(String value) {
    var search = value.toLowerCase();

    if (value.isNotEmpty) {
      var filtered = state.cultivos
          .where((objeto) =>
              (objeto.planta ?? '').toLowerCase().contains(search) ||
              (objeto.finca ?? '').toLowerCase().contains(search) ||
              (objeto.direccion ?? '').toLowerCase().contains(search) ||
              (objeto.zona ?? '').toLowerCase().contains(search))
          .toList();
      state = state.copyWith(filterCultivos: filtered);
      return filtered;
    } else {
      state = state.copyWith(filterCultivos: state.cultivos);
      return state.cultivos;
    }
  }

  // Cargar lista de actividades de cultivo en state
  Future<ActivityCropsResponseModel> loadActivitiesCrop({required CropModel cropModel}) async {
    ActivityCropsResponseModel resp = ActivityCropsResponseModel();
    resp = await listCropsUseCase.loadActivitiesCrop(cropModel: cropModel, isOnline: online);
    if (resp.error != null) {
      throw Exception(resp.error);
    }
    state = state.copyWith(actividades: resp.actividades, filterActivities: resp.actividades);
    filterActivitiesByTextAndDate(firstDayMonth(), lastDayMonth(), '');

    return resp;
  }

  // Filtro de texto actividades de cultivo
  List<ActivityCropModel> filterActivitiesCrop(String value) {
    var search = value.toLowerCase();

    if (value.isNotEmpty) {
      var filtered = state.actividades
          .where((objeto) =>
              (objeto.nombre ?? '').toLowerCase().contains(search) ||
              (objeto.finca ?? '').toLowerCase().contains(search) ||
              (objeto.zona ?? '').toLowerCase().contains(search) ||
              (objeto.estado ?? '').toLowerCase().contains(search) ||
              (objeto.obrero ?? '').toLowerCase().contains(search))
          .toList();
      state = state.copyWith(filterActivities: filtered);
      return filtered;
    } else {
      state = state.copyWith(filterActivities: state.actividades);
      return state.actividades;
    }
  }

  // Filtro de fecha actividades de cultivo
  List<ActivityCropModel> filterActivitiesCropDate(DateTime date1, DateTime date2) {
    List<ActivityCropModel> listAct = state.actividades.where((object) {
      return DateTime.parse(object.fecha ?? '').isAfter(date1) && DateTime.parse(object.fecha ?? '').isBefore(date2);
    }).toList();
    return listAct;
  }

  // Filtro de texto y fecha actividades de cultivo
  void filterActivitiesByTextAndDate(DateTime date1, DateTime date2, String value) {
    var listDate = filterActivitiesCropDate(date1, date2);
    var listText = filterActivitiesCrop(value);

    var listAct = listDate.where((element) => listText.contains(element)).toList();

    state = state.copyWith(filterActivities: listAct);
  }

  // seleccionar cultivo
  void updateSelectCrop(CropModel select) {
    state = state.copyWith(selectedCrop: select);
  }

  // llamar cargado de actividades
  Future<ActivityCropsResponseModel> initActivitiesCrop() {
    return loadActivitiesCrop(cropModel: state.selectedCrop ?? CropModel());
  }

  ///
  /// Gestion de ingresos
  ///

  // Cargar factiras de ingresos
  Future<List<BillModel>> loadBillsIncome() async {
    await loadBills();
    filterIncomebyDate(firstDayMonth(), lastDayMonth());
    return state.ingresos;
  }

  ///
  /// Gestion de egresos
  ///

  // Cargar facturas de egreso
  Future<List<BillModel>> loadBillsExpenses() async {
    await loadBills();
    filterExpensebyDate(firstDayMonth(), lastDayMonth());
    return state.egresos;
  }

  // Cargar facturas
  Future<ResponseModel<List<BillModel>>> loadBills() async {
    ResponseModel<List<BillModel>> resp;
    resp = await billsUseCase.loadBillsByFactory(idEmpresa: idEmpresa.toString(), isOnline: online);
    if (resp.error != null) {
      throw Exception(resp.error);
    }

    var ingresos = resp.response!.where((element) => element.ventas != null).toList();
    var egresos =
        resp.response!.where((element) => element.compras != null || element.actividadObrero != null).toList();

    state = state.copyWith(
      ingresos: ingresos,
      egresos: egresos,
      filterIngresos: ingresos,
      filterEgresos: egresos,
    );
    return resp;
  }

  /// Informe diario

  // Cargar el informe diario
  Future<DayReportModel> loadDailyreport() async {
    var facturas = await loadBills();

    List<BillModel> ingresosHoy = billsByDay(state.ingresos, state.dateFilterReport ?? DateTime.now());
    List<BillModel> egresosHoy = billsByDay(state.egresos, state.dateFilterReport ?? DateTime.now());

    var points = convertToPointsHour(ingresosHoy, egresosHoy);
    var gananciasHoy = totalBills(ingresosHoy);
    var gastosHoy = totalBills(egresosHoy);

    var billsLabranza = searchBillsActivity(egresosHoy, 'Labranza');
    var billsSiembra = searchBillsActivity(egresosHoy, 'Siembra');
    var billsRiego = searchBillsActivity(egresosHoy, 'Riego');
    var billsPoda = searchBillsActivity(egresosHoy, 'Poda');
    var billsCosecha = searchBillsActivity(egresosHoy, 'Cosecha');

    var report = DayReportModel(
      grafica: points,
      ventaTotal: ingresosHoy.length,
      compraTotal: egresosHoy.length,
      ganaciaTotal: gananciasHoy,
      gastoTotal: gastosHoy,
      labranzas: billsLabranza.length,
      siembras: billsSiembra.length,
      riegos: billsRiego.length,
      podas: billsPoda.length,
      cosechas: billsCosecha.length,
      costolabranzas: getTotal(billsLabranza),
      costoSiembras: getTotal(billsSiembra),
      costoRiegos: getTotal(billsRiego),
      costoPodas: getTotal(billsPoda),
      costoCosechas: getTotal(billsCosecha),
      error: facturas.error ?? '',
    );

    state = state.copyWith(informeDiario: report);
    return report;
  }

  //
  double getTotal(List<BillModel> list) {
    return list.fold(0, (double acumulador, BillModel objeto) => acumulador + (objeto.total ?? 0));
  }

  // Cambiar la fecha del informe diario
  void filterDateDailyReport(DateTime date) {
    state = state.copyWith(dateFilterReport: date);
    loadDailyreport();
  }

  // Buscar factura por actividad
  List<BillModel> searchBillsActivity(List<BillModel> facturas, String activity) {
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

  //
  List<BillModel> billsByDay(List<BillModel> listBills, DateTime dateFilter) {
    return listBills.where((ingreso) {
      return sameDate(ingreso.fecha!, dateFilter);
    }).toList();
  }

  //
  bool sameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  //
  double totalBills(List<BillModel> ingresosHoy) {
    return ingresosHoy.fold(0.0, (a, b) => a + (b.total ?? 0.0));
  }

  //
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

  ///
  /// Informe historico
  ///

  //
  Future<ResponseModel<List<BillModel>>> getHistoryReport() async {
    var facturas = await loadBills();

    var history = state.egresos + state.ingresos;
    history.sort((a, b) => a.fecha!.compareTo(b.fecha!));

    state = state.copyWith(filterHistory: history);

    return ResponseModel(
      response: history,
      error: facturas.error ?? '',
    );
  }

  //
  Future<ResponseModel> loadListWorkers() async {
    var resp = await listCropsUseCase.loadListWorkers(idEmpresa: idEmpresa.toString(), isOnline: online);
    return resp;
  }

  //
  Future<bool> newActivity(NewActivityModel newActivity) async {
    var resp = await listCropsUseCase.newActivity(newActivity: newActivity, isOnline: online);
    return resp.response ?? false;
  }

  //
  void filterIncomebyDate(DateTime? date1, DateTime? date2) {
    List<BillModel> listBills = state.ingresos.where((object) {
      if (object.fecha != null && date1 != null && date2 != null) {
        return object.fecha!.isAfter(date1) && object.fecha!.isBefore(date2);
      } else {
        return true;
      }
    }).toList();
    state = state.copyWith(filterIngresos: listBills);
  }

  //
  void filterExpensebyDate(DateTime? date1, DateTime? date2) {
    List<BillModel> listBills = state.egresos.where((object) {
      if (object.fecha != null && date1 != null && date2 != null) {
        return object.fecha!.isAfter(date1) && object.fecha!.isBefore(date2);
      } else {
        return true;
      }
    }).toList();

    state = state.copyWith(filterEgresos: listBills);
  }

  //
  List<BillModel> filterHistorybyDate(DateTime? date1, DateTime? date2) {
    var history = state.egresos + state.ingresos;
    history.sort((a, b) => a.fecha!.compareTo(b.fecha!));

    List<BillModel> listBills = history.where((object) {
      if (object.fecha != null && date1 != null && date2 != null) {
        return object.fecha!.isAfter(date1) && object.fecha!.isBefore(date2);
      } else {
        return true;
      }
    }).toList();
    return listBills;
  }

  //
  List<BillModel> filterHistoryText(String value) {
    var search = value.toLowerCase();

    var history = state.egresos + state.ingresos;
    history.sort((a, b) => a.fecha!.compareTo(b.fecha!));

    if (value.isNotEmpty) {
      var filtered = history
          .where((objeto) =>
              (objeto.numeroFactura ?? '').toLowerCase().contains(search) ||
              (objeto.tipo ?? '').toLowerCase().contains(search) ||
              (objeto.actividadObrero?.nombre ?? '').toLowerCase().contains(search) ||
              (objeto.total ?? 0).toString().contains(search))
          .toList();
      return filtered;
    } else {
      return history;
    }
  }

  //
  void filterHistory(DateTime? date1, DateTime? date2, String value) {
    var listDate = filterHistorybyDate(date1, date2);
    var listText = filterHistoryText(value);

    var listHistory = listDate.where((element) => listText.contains(element)).toList();

    state = state.copyWith(filterHistory: listHistory);
  }

  ///
  /// Informe financiero
  ///

  //
  Future<FinancialReportModel> getFinancialReport() async {
    var facturas = await loadBills();

    var ganaciaTotal = totalBills(state.ingresos);
    var gastoTotal = totalBills(state.egresos);

    List<PointChartModel> historicalGraph = convertToPointsMonth(state.ingresos, state.egresos);

    var report = FinancialReportModel(
      ventasTotales: state.ingresos.length,
      comprasTotales: state.egresos.length,
      ganaciaTotal: ganaciaTotal,
      gastoTotal: gastoTotal,
      historicalGraph: historicalGraph,
      error: facturas.error ?? '',
    );

    state = state.copyWith(financialReport: report);

    return report;
  }

  //
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

  //
  List<PointChartModel> convertToPointsMonth(List<BillModel> facturasIngresos, List<BillModel> facturasEgresos) {
    List<PointChartModel> points = [];

    for (int i = 1; i <= 12; i++) {
      PointChartModel point;
      double totalIngresos = facturasIngresos
          .where((factura) => factura.fecha!.month == i)
          .fold(0, (a, b) => a + (b.total ?? 0) / 1000000);
      double totalEgresos =
          facturasEgresos.where((factura) => factura.fecha!.month == i).fold(0, (a, b) => a + (b.total ?? 0) / 1000000);
      point = PointChartModel(x: i, y: totalIngresos, z: totalEgresos);
      points.add(point);
    }
    return points;
  }

  ///
  /// Informe de cultivos
  ///

  //
  Future<ResponseModel<List<BillModel>>> loadBillsCrop() async {
    ResponseModel<List<BillModel>> resp;
    resp = await billsUseCase.loadBillsByCrop(idCultivo: state.selectedCrop!.idCultivo.toString(), isOnline: online);
    if (resp.error != null) {
      throw Exception(resp.error);
    }

    var ingresos = resp.response!.where((element) => element.ventas != null).toList();
    var egresos =
        resp.response!.where((element) => element.compras != null || element.actividadObrero != null).toList();

    state = state.copyWith(ingresos: ingresos, egresos: egresos, filterIngresos: ingresos, filterEgresos: egresos);
    return resp;
  }

  //
  Future<FinancialReportModel> getFinancialCropReport() async {
    var facturas = await loadBillsCrop();

    var ganaciaTotal = totalBills(state.ingresos);
    var gastoTotal = totalBills(state.egresos);

    List<PointChartModel> historicalGraph = convertToPointsYear(state.ingresos, state.egresos);

    var report = FinancialReportModel(
      ventasTotales: state.ingresos.length,
      comprasTotales: state.egresos.length,
      ganaciaTotal: ganaciaTotal,
      gastoTotal: gastoTotal,
      historicalGraph: historicalGraph,
      error: facturas.error,
    );

    return report;
  }
}

final supervisorController = StateNotifierProvider<SupervisorController, SupervisorState>(
  (ref) => SupervisorController(
    CropsUseCaseImpl(CropsDataSource()),
    BillsUseCaseImpl(BillsDataSource()),
    ref.watch(loginController).idEmpresa,
    ref.watch(onlineProvider),
  ),
);

///
/// Controladores de carga
///

final asignacionCultivos = FutureProvider.autoDispose<CropsResponseModel>((ref) async {
  return ref.read(supervisorController.notifier).loadCrops();
});

final cropActController = FutureProvider.autoDispose<ActivityCropsResponseModel>((ref) async {
  return ref.read(supervisorController.notifier).initActivitiesCrop();
});

final listObreros = FutureProvider.autoDispose<ResponseModel>((ref) async {
  return ref.read(supervisorController.notifier).loadListWorkers();
});

final gestionIngresos = FutureProvider.autoDispose<List<BillModel>>((ref) async {
  return ref.read(supervisorController.notifier).loadBillsIncome();
});

final gestionEgresos = FutureProvider.autoDispose<List<BillModel>>((ref) async {
  return ref.read(supervisorController.notifier).loadBillsExpenses();
});

final informeDiario = FutureProvider.autoDispose<DayReportModel>((ref) async {
  return ref.read(supervisorController.notifier).loadDailyreport();
});

final balanceFinanciero = FutureProvider.autoDispose<FinancialReportModel>((ref) async {
  return ref.read(supervisorController.notifier).getFinancialReport();
});

final informeHistorico = FutureProvider.autoDispose<ResponseModel<List<BillModel>>>((ref) async {
  return ref.read(supervisorController.notifier).getHistoryReport();
});

final informeCultivo = FutureProvider.autoDispose<FinancialReportModel>((ref) async {
  return ref.read(supervisorController.notifier).getFinancialCropReport();
});
