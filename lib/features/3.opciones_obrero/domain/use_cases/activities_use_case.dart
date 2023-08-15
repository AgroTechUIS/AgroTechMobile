import 'package:agrotech/features/3.opciones_obrero/data/network/activities_data_source.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/activities_response_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/user_model.dart';

abstract class ActivitiesUseCase {
  Future<ActivitiesResponseModel> loadActivities({required UserModel userModel});
}

class ActivitiesUseCaseImpl extends ActivitiesUseCase {
  final ActivitiesDataSource activitiesDataSource;

  ActivitiesUseCaseImpl(
    this.activitiesDataSource,
  );

  @override
  Future<ActivitiesResponseModel> loadActivities({required UserModel userModel}) async {
    var response = await activitiesDataSource.loadActivities(userModel: userModel);
    if (response.success) {
      return ActivitiesResponseModel.fromJson(response.body ?? {});
    } else {
      return ActivitiesResponseModel(error: 'loadActivities:success:false');
    }
  }
}
