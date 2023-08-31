import '../../domain/models/crop_response_model.dart';

abstract class CropRepository {
  Future<List<CropResponseModel>?> getCrops(int idCrop); // ??
}
