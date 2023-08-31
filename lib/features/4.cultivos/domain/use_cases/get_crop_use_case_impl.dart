import 'package:agrotech/features/4.cultivos/data/network/crop_repository.dart';
import 'package:agrotech/features/4.cultivos/data/network/crop_service.dart';
import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';

import 'get_crop_use_case.dart';

class GetCropUseCaseImpl extends GetCropUseCase {
  final CropRepository cropRepository;

  GetCropUseCaseImpl(
    this.cropRepository,
  );

  @override
  Future<List<CropResponseModel>?> getCrops({required int idCrop}) async {
    var response = await cropRepository.getCrops(idCrop);
    return response;
/*
    if (response!.success) {
      var listaPlagas = listcropFromJson(response.body as List);

      return listaPlagas;
    } else {
      return null;
    }*/
  }
}
