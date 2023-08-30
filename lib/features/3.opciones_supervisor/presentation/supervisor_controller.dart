import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:agrotech/features/3.opciones_supervisor/data/List_crops_data_source.dart';
import 'package:agrotech/features/3.opciones_supervisor/data/bills_data_source.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_response_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/bills_response%20model.dart';
import 'package:agrotech/features/3.opciones_supervisor/models/company_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crops_response_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/use_cases/bills_use_case.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/use_cases/list_crops_use_case.dart';
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
    var resp = await listCropsUseCase.loadCrops(
        companyModel: CompanyModel(idEmpresa: idEmpresa));
    state = state.copyWith(cultivos: resp.cultivos);
    return resp;
  }

  Future<ActivityCropsResponseModel> loadActivitiesCrop(
      {required CropModel cropModel}) async {
    var resp = await listCropsUseCase.loadActivitiesCrop(cropModel: cropModel);
    state = state.copyWith(actividades: resp.actividades);
    return resp;
  }

  /*Future<BillsResponseModel> loadBillsClient() async {
    var resp = await billsUseCase.loadBillsClient(companyModel: CompanyModel(idEmpresa: idEmpresa));
    state = state.copyWith(actividades: resp.actividades);
    return resp;
  }*/
}

final supervisorController =
    StateNotifierProvider<SupervisorController, SupervisorState>(
  (ref) => SupervisorController(
    CropsUseCaseImpl(CropsDataSource()),
    BillsUseCaseImpl(BillsDataSource()),
    ref.watch(loginController).idEmpresa,
  ),
);
