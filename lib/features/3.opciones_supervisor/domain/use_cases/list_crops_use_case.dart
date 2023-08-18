import 'package:agrotech/features/3.opciones_supervisor/data/List_crops_data_source.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_response_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/company_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crops_response_model.dart';

abstract class CropsUseCase {
  Future<CropsResponseModel> loadCrops({required CompanyModel companyModel});
  Future<ActivityCropsResponseModel> loadActivitiesCrop({required CropModel cropModel});
}

class CropsUseCaseImpl extends CropsUseCase {
  final CropsDataSource listCropsDataSource;

  CropsUseCaseImpl(
    this.listCropsDataSource,
  );

  @override
  Future<CropsResponseModel> loadCrops({required CompanyModel companyModel}) async {
    var response = await listCropsDataSource.loadCrops(companyModel: companyModel);
    if (response.success) {
      return CropsResponseModel.fromJson(response.body ?? {});
    } else {
      return CropsResponseModel(error: 'loadCrops:success:false');
    }
  }

  @override
  Future<ActivityCropsResponseModel> loadActivitiesCrop({required CropModel cropModel}) async {
    var response = await listCropsDataSource.loadActivitiesCrop(cropModel: cropModel);
    if (response.success) {
      return ActivityCropsResponseModel.fromJson(response.body ?? {});
    } else {
      return ActivityCropsResponseModel(error: 'loadCrops:success:false');
    }
  }
}
