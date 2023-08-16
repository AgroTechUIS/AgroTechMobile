import 'package:agrotech/features/3.opciones_obrero/data/network/activities_data_source.dart';
import 'package:agrotech/features/3.opciones_obrero/data/network/update_activities_data_source.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/activities_response_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/update_activity_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/user_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/use_cases/activities_use_case.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/use_cases/update_activities_use_case.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_state.dart';
import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:riverpod/riverpod.dart';

class ActividadesController extends StateNotifier<ActividadesState> {
  ActividadesController(this.activitiesUseCaseImpl, this.idusuario, this.updateActivitiesUseCaseImpl)
      : super(ActividadesState()) {
    loadActivities();
  }

  // Use cases
  final ActivitiesUseCaseImpl activitiesUseCaseImpl;
  final UpdateActivitiesUseCaseImpl updateActivitiesUseCaseImpl;
  final String idusuario;

  Future<ActivitiesResponseModel> loadActivities() async {
    var resp = await activitiesUseCaseImpl.loadActivities(userModel: UserModel(idUsuario: idusuario));
    state = state.copyWith(actividades: resp.activities);
    return resp;
  }

  Future<String> updateActivities() async {
    var resp = await updateActivitiesUseCaseImpl.updateActivities(
        updateActivityModel: UpdateActivityModel(
      idActividad: 0,
      estado: '',
      descripcion: '',
    ));
    return resp;
  }
}

final activitiesController = StateNotifierProvider.autoDispose<ActividadesController, ActividadesState>(
  (ref) => ActividadesController(
    ActivitiesUseCaseImpl(ActivitiesDataSource()),
    ref.watch(loginController).idusuario,
    UpdateActivitiesUseCaseImpl(UpdateActivitiesDataSource()),
  ),
);
