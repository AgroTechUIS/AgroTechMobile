import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';
import 'package:agrotech/features/4.cultivos/domain/models/plant_model.dart';

import '../../data/network/crop_repository_impl.dart';

abstract class GetCropUseCase {
  Future<List<CropResponseModel>?> getListCrops({required int idEmpresa});
}

class GetCropUseCaseImpl extends GetCropUseCase {
  final CropRepository cropRepository;

  GetCropUseCaseImpl(
    this.cropRepository,
  );

  @override
  Future<List<CropResponseModel>?> getListCrops({required int idEmpresa}) async {
    try {
      var cropData = await cropRepository.getCropsByEmail(idEmpresa);
      List<CropResponseModel>? listCrops = [];

      for (var entry in cropData['crops']) {
        listCrops.add(CropResponseModel.fromJson(entry));
      }
      return listCrops;
    } catch (e) {
      throw ('Error al obtener la lista de cultivos: $e');
    }
  }

  Future<List<PlantResponseModel>?> getListPlants() async {
    try {
      var cropData = await cropRepository.getPlants();
      List<PlantResponseModel>? listPlants = [];

      for (var entry in cropData['body']) {
        listPlants.add(PlantResponseModel.fromJson(entry));
      }
      return listPlants;
    } catch (e) {
      throw ('Error al obtener la lista de plantas: $e');
    }
  }

  Future<Map<String, dynamic>> updateCrop(CropResponseModel? updatedCrops) async {
    try {
      final cropData = updatedCrops!.toJsonEdit();
      var r = await cropRepository.updateCropDataRep(cropData);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de cultivos: $e');
    }
  }

  Future<String> deleteCrop(int? idCrop) async {
    try {
      var d = await cropRepository.deleteCropsById(idCrop);
      return d;
    } catch (e) {
      throw ('Error al borrar el cultivo: $e');
    }
  }

  Future<Map<String, dynamic>> saveCrop(CropResponseModel? savedCultivos) async {
    try {
      final cropData = savedCultivos!.toJson();
      var s = await cropRepository.saveCropDataRep(cropData);
      return s;
    } catch (e) {
      throw ('Error al guardar el cultivo: $e');
    }
  }
}
