import 'package:agrotech/features/4.cultivos/data/network/crop_repository.dart';
import 'package:agrotech/features/4.cultivos/data/network/crop_service.dart';
import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';

class CropRepositoryImpl implements CropRepository {
  final CropService cropService;

  CropRepositoryImpl(this.cropService);

  @override
  Future<List<CropResponseModel>?> getCrops(int idCrop) async {
    return null;

    // Implementa la lógica para obtener los cultivos utilizando cropService
  }
}
