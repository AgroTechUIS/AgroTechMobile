import 'package:agrotech/features/3.opciones_obrero/data/network/activities_data_source.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/activities_response_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/user_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/use_cases/activities_use_case.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_state.dart';
import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:riverpod/riverpod.dart';

class ActividadesController extends StateNotifier<ActividadesState> {
  ActividadesController(this.loginUseCaseImpl, this.idusuario) : super(ActividadesState()) {
    loadActivities();
  }

  // Use cases
  final ActivitiesUseCaseImpl loginUseCaseImpl;
  final String idusuario;

  Future<ActivitiesResponseModel> loadActivities() async {
    var resp = await loginUseCaseImpl.loadActivities(userModel: UserModel(idUsuario: idusuario));
    state = state.copyWith(actividades: resp.activities);
    return resp;
  }
}

final activitiesController = StateNotifierProvider.autoDispose<ActividadesController, ActividadesState>(
  (ref) => ActividadesController(
    ActivitiesUseCaseImpl(ActivitiesDataSource()),
    ref.watch(loginController).idusuario,
  ),
);
