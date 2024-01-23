// coverage:ignore-file
import 'package:agrotech/features/5.cuidados/data/network/cuidado_service.dart';
import 'package:agrotech/features/5.cuidados/domain/models/cuidado_response_model.dart';

abstract class CareRepository {
  Future<Map<String, dynamic>> getCareByCrop(int idCrop);
}

class CareRepositoryImpl implements CareRepository {
  final CareService careService;

  CareRepositoryImpl(this.careService);

  @override
  Future<Map<String, dynamic>> getCareByCrop(int idCrop) async {
    try {
      final careData = await careService.getCares(idCrop);
      if (careData.success) {
        return careData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de los cuidados: $e');
    }
  }

  Future<Map<String, dynamic>> updateCareDataRep(
      Map<String, dynamic> careData) async {
    try {
      final response = await careService.updateCareData(careData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al actualizar datos del cuidado: $e');
    }
  }

  Future<Map<String, dynamic>> saveCareDataRep(
      Map<String, dynamic> careData) async {
    try {
      final response = await careService.saveCareData(careData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al guardar datos de la plaga: $e');
    }
  }

  Future<String> deleteCaresById(int? idCare) async {
    try {
      final careData = await careService.deleteCareData(idCare);
      if (careData.success) {
        return careData.message ?? 'Cuidado borrado';
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al borrar datos del cuidado: $e');
    }
  }
}
