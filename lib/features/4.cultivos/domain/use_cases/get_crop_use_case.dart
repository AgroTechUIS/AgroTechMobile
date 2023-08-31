import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';

abstract class GetCropUseCase {
  Future<List<CropResponseModel>?> getCrops({required int idCrop});
}
