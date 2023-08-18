import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:agrotech/features/3.opciones_supervisor/data/List_crops_data_source.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/company_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crops_response_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/use_cases/list_crops_use_case.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SupervisorController extends StateNotifier<SupervisorState> {
  SupervisorController(this.listCropsUseCase, this.idEmpresa) : super(SupervisorState()) {
    loadCrops();
  }

  // Use cases
  final CropsUseCaseImpl listCropsUseCase;
  final int idEmpresa;

  Future<CropsResponseModel> loadCrops() async {
    var resp = await listCropsUseCase.loadCrops(companyModel: CompanyModel(idEmpresa: idEmpresa));
    state = state.copyWith(cultivos: resp.cultivos);
    return resp;
  }
}

final activitiesController = StateNotifierProvider.autoDispose<SupervisorController, SupervisorState>(
  (ref) => SupervisorController(
    CropsUseCaseImpl(CropsDataSource()),
    ref.watch(loginController).idEmpresa,
  ),
);
