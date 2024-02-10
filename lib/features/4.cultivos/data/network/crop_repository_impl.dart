// coverage:ignore-file
import 'package:agrotech/features/4.cultivos/data/network/crop_service.dart';
import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';

abstract class CropRepository {
  Future<Map<String, dynamic>> getCropsByEmail(int idEmpresa); // ??
  Future<Map<String, dynamic>> getPlants(); // ??

  Future<String> deleteCropsById(int? idCrop);

  Future<Map<String, dynamic>> saveCropDataRep(Map<String, dynamic> cropData);
  Future<Map<String, dynamic>> updateCropDataRep(Map<String, dynamic> pestData);
}

class CropRepositoryImpl implements CropRepository {
  final CropService cropService;

  CropRepositoryImpl(this.cropService);

  @override
  Future<Map<String, dynamic>> getCropsByEmail(int idEmpresa) async {
    try {
      final cropData = await cropService.getCrops(idEmpresa: idEmpresa);
      if (cropData.success) {
        return cropData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de los cultivos: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getPlants() async {
    try {
      final cropData = await cropService.getPlants();
      if (cropData.success) {
        return cropData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de los cultivos: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateCropDataRep(Map<String, dynamic> cropData) async {
    try {
      final response = await cropService.updateCropData(cropData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al actualizar datos del cultivo: $e');
    }
  }

  @override
  Future<String> deleteCropsById(int? idCrop) async {
    try {
      final cropData = await cropService.deleteCropData(idCrop);
      if (cropData.success) {
        return cropData.message ?? 'Cultivo borrado';
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al borrar datos del cultivo: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> saveCropDataRep(Map<String, dynamic> cropData) async {
    try {
      final response = await cropService.saveCropData(cropData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al guardar datos del cultivo: $e');
    }
  }
}
