import 'package:agrotech/common_utilities/controllers/offline_controller.dart';
import 'package:agrotech/common_utilities/models/list_response_model.dart';
import 'package:agrotech/common_utilities/models/response_model.dart';
import 'package:agrotech/common_utilities/tools.dart';
import 'package:agrotech/features/3.opciones_obrero/data/network/activities_data_source.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/update_activity_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/user_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/use_cases/activities_use_case.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_state.dart';
import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';
import 'package:riverpod/riverpod.dart';

class ActividadesController extends StateNotifier<ActividadesState> {
  ActividadesController(
    this.activitiesUseCaseImpl,
    this.idusuario,
    this.online,
  ) : super(ActividadesState());

  // Use cases
  final ActivitiesUseCaseImpl activitiesUseCaseImpl;
  final String idusuario;
  final bool online;

  /// Carga las actividades que debe hacer el obrero
  Future<ResponseModel<List<ActivityModel>>> loadActivities() async {
    ResponseModel<List<ActivityModel>> resp;

    if (online) {
      resp = await activitiesUseCaseImpl.loadActivities(userModel: UserModel(idUsuario: idusuario));
      if (resp.error == null) {
        saveLoadActivities(resp);
      } else {
        throw Exception(resp.error);
      }
    } else {
      resp = await searchLoadActivities();
    }

    state = state.copyWith(actividades: resp.response, actividadesFiltered: resp.response);
    return resp;
  }

  /// Guarda la lista de actividades
  void saveLoadActivities(ResponseModel<List<ActivityModel>> resp) async {
    var pref = await SecureSharedPref.getInstance();
    List<Map<String, dynamic>> listaDeMapas = resp.response!.map((obj) => obj.toJson()).toList();
    pref.putMap("Activities", {"act": listaDeMapas});
    for (ActivityModel activity in resp.response!) {
      var date = activity.fecha ?? DateTime(0);
      if (date.isAfter(DateTime.now())) {
        scheduleNotification(date: date, id: activity.id ?? 0, name: activity.nombre ?? "Actividad");
      }
    }
  }

  /// Busca la lista de actividades en storage
  Future<ResponseModel<List<ActivityModel>>> searchLoadActivities() async {
    var pref = await SecureSharedPref.getInstance();
    var mapActivities = await pref.getMap("Activities") as Map<String, dynamic>;
    var savedList = ListResponseModel.fromJson(
      mapActivities,
      (json) => ActivityModel.fromJson(json),
      'act',
    );
    return ResponseModel(response: savedList.list);
  }

  /// Actualiza el estado de la actividad
  Future<bool> updateActivities(UpdateActivityModel updateActivityModel) async {
    var pref = await SecureSharedPref.getInstance();
    ResponseModel<String> resp;

    pref.putMap(
      "SavedActivities",
      updateActivityModel.toJson(),
    );

    if (online) {
      resp = await activitiesUseCaseImpl.updateActivities(updateActivityModel: updateActivityModel);
      return resp.response == 'actividad actualizada';
    } else {
      return true;
    }
  }

  /// Filtro de actividades
  void filterActivities(String value) {
    var search = value.toLowerCase();

    if (value.isNotEmpty) {
      var filtered = state.actividades
          .where((objeto) =>
              (objeto.nombre ?? '').toLowerCase().contains(search) ||
              (objeto.fecha.toString()).contains(search) ||
              (objeto.finca ?? '').contains(search) ||
              (objeto.estado ?? '').contains(search))
          .toList();
      state = state.copyWith(actividadesFiltered: filtered);
    } else {
      state = state.copyWith(actividadesFiltered: state.actividades);
    }
  }

  /// Cambio del filtro de fecha
  void changeDate(DateTime? date1, DateTime? date2) {
    var listAct = state.actividades.where((object) {
      if (object.fecha != null && date1 != null && date2 != null) {
        return object.fecha!.isAfter(date1) && object.fecha!.isBefore(date2);
      } else {
        return true;
      }
    }).toList();

    state = state.copyWith(actividadesFiltered: listAct);
  }
}

final activitiesController = StateNotifierProvider.autoDispose<ActividadesController, ActividadesState>(
  (ref) => ActividadesController(
    ActivitiesUseCaseImpl(ActivitiesDataSource()),
    ref.watch(loginController).idusuario,
    ref.watch(onlineProvider),
  ),
);

final activityObrero = FutureProvider.autoDispose<ResponseModel<List<ActivityModel>>>((ref) async {
  return ref.read(activitiesController.notifier).loadActivities();
});
