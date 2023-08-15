import 'package:agrotech/features/3.opciones_obrero/data/network/update_activities_data_source.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/update_activity_model.dart';

abstract class UpdateActivitiesUseCase {
  Future<String> updateActivities({required UpdateActivityModel updateActivityModel});
}

class UpdateActivitiesUseCaseImpl extends UpdateActivitiesUseCase {
  final UpdateActivitiesDataSource activitiesDataSource;

  UpdateActivitiesUseCaseImpl(
    this.activitiesDataSource,
  );

  @override
  Future<String> updateActivities({required UpdateActivityModel updateActivityModel}) async {
    var response = await activitiesDataSource.updateActivities(updateActivityModel: updateActivityModel);
    if (response.success) {
      return response.body!['accion'] ?? "";
    } else {
      return 'updateActivities:success:false';
    }
  }
}
