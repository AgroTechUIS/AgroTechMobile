import 'package:agrotech/common_utilities/controllers/offline_controller.dart';
import 'package:agrotech/common_utilities/tools.dart';
import 'package:agrotech/features/3.opciones_obrero/data/network/activities_data_source.dart';
import 'package:agrotech/features/3.opciones_obrero/data/network/update_activities_data_source.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/activities_response_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/update_activity_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/user_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/use_cases/activities_use_case.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/use_cases/update_activities_use_case.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_state.dart';
import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';
import 'package:riverpod/riverpod.dart';

class ActividadesController extends StateNotifier<ActividadesState> {
  ActividadesController(
    this.activitiesUseCaseImpl,
    this.updateActivitiesUseCaseImpl,
    this.idusuario,
    this.online,
    this.onlineController,
  ) : super(ActividadesState());

  // Use cases
  final ActivitiesUseCaseImpl activitiesUseCaseImpl;
  final UpdateActivitiesUseCaseImpl updateActivitiesUseCaseImpl;
  final String idusuario;
  final bool online;
  final StateController<bool> onlineController;

  /// Carga las actividades que debe hacer el obrero
  Future<ActivitiesResponseModel> loadActivities() async {
    var pref = await SecureSharedPref.getInstance();
    var resp = await activitiesUseCaseImpl.loadActivities(userModel: UserModel(idUsuario: idusuario));
    if (resp.error == null && online) {
      pref.putMap(
        "Activities",
        resp.toJson(),
      );
      for (ActivityModel activity in resp.activities!) {
        var date = DateTime.parse(activity.fecha ?? "");
        if (date.isAfter(DateTime.now())) {
          scheduleNotification(date: date, id: activity.id ?? 0, name: activity.nombre ?? "Actividad");
        }
      }
    } else if (resp.error != null && !online) {
      var mapActivities = await pref.getMap("Activities") as Map<String, dynamic>;
      resp = mapActivities["actividades"] != null
          ? ActivitiesResponseModel.fromJson(mapActivities)
          : ActivitiesResponseModel(activities: []);
    } else if (resp.error != null && online) {
      onlineController.update((state) => false);
      throw Exception('Latencia');
    } else {
      throw Exception('Conected');
    }

    state = state.copyWith(actividades: resp.activities, actividadesFiltered: resp.activities);
    return resp;
  }

  /// Actualiza el estado de la actividad
  Future<bool> updateActivities(UpdateActivityModel updateActivityModel) async {
    var pref = await SecureSharedPref.getInstance();
    var resp = await updateActivitiesUseCaseImpl.updateActivities(updateActivityModel: updateActivityModel);
    if (!online) {
      pref.putMap(
        "ActivitiesGuardadas",
        updateActivityModel.toJson(),
      );
    }
    if (resp != 'actividad actualizada') {
      onlineController.update((state) => false);
    }
    return resp == 'actividad actualizada';
  }

  void filterActivities(String value) {
    var search = value.toLowerCase();

    if (value.isNotEmpty) {
      var filtered = state.actividades
          .where((objeto) =>
              (objeto.nombre ?? '').toLowerCase().contains(search) ||
              (objeto.fecha ?? '').contains(search) ||
              (objeto.finca ?? '').contains(search) ||
              (objeto.estado ?? '').contains(search))
          .toList();
      state = state.copyWith(actividadesFiltered: filtered);
    } else {
      state = state.copyWith(actividadesFiltered: state.actividades);
    }
  }
}

final activitiesController = StateNotifierProvider.autoDispose<ActividadesController, ActividadesState>(
  (ref) => ActividadesController(
    ActivitiesUseCaseImpl(ActivitiesDataSource()),
    UpdateActivitiesUseCaseImpl(UpdateActivitiesDataSource()),
    ref.watch(loginController).idusuario,
    ref.watch(onlineProvider),
    ref.read(onlineProvider.notifier),
  ),
);

final activityObrero = FutureProvider.autoDispose<ActivitiesResponseModel>((ref) async {
  return ref.read(activitiesController.notifier).loadActivities();
});
