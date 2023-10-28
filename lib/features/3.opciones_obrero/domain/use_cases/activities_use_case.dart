import 'package:agrotech/common_utilities/models/list_response_model.dart';
import 'package:agrotech/common_utilities/models/response_model.dart';
import 'package:agrotech/features/3.opciones_obrero/data/network/activities_data_source.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/update_activity_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/user_model.dart';

abstract class ActivitiesUseCase {
  Future<ResponseModel<List<ActivityModel>>> loadActivities({required UserModel userModel});
  Future<ResponseModel<String>> updateActivities({required UpdateActivityModel updateActivityModel});
}

class ActivitiesUseCaseImpl extends ActivitiesUseCase {
  final ActivitiesDataSource activitiesDataSource;

  ActivitiesUseCaseImpl(
    this.activitiesDataSource,
  );

  @override
  Future<ResponseModel<List<ActivityModel>>> loadActivities({required UserModel userModel}) async {
    var response = await activitiesDataSource.loadActivities(user: userModel.idUsuario ?? '');
    if (response.success) {
      var respon = ListResponseModel.fromJson(
        response.body ?? {},
        (json) => ActivityModel.fromJson(json),
        'actividades',
      );
      return ResponseModel(response: respon.list);
    } else {
      return ResponseModel(error: response.message);
    }
  }

  @override
  Future<ResponseModel<String>> updateActivities({required UpdateActivityModel updateActivityModel}) async {
    var response = await activitiesDataSource.updateActivities(updateActivityModel: updateActivityModel);
    if (response.success) {
      return ResponseModel(response: response.body!['accion'] ?? "");
    } else {
      return ResponseModel(error: response.message);
    }
  }
}
