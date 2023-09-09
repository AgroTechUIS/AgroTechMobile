import 'dart:convert';

import 'package:agrotech/features/5.plagas/data/network/pest_service.dart';

abstract class PestRepository {
  Future<Map<String, dynamic>> getPestsByCrop(int idCrop);
}

class PestRepositoryImpl implements PestRepository {
  final PestService pestService;

  PestRepositoryImpl(this.pestService);

  @override
  Future<Map<String, dynamic>> getPestsByCrop(int idCrop) async {
    try {
      final pestData = await pestService.getPestData(idCrop);
      if (pestData.success) {
        return pestData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de las plagas: $e');
    }
  }

  Future<Map<String, dynamic>> updatePestDataRep(
      Map<String, dynamic> pestData) async {
    try {
      final response = await pestService.updatePestData(pestData);

      if (response.statusCode == 200) {
        // Aquí puedes procesar la respuesta del servidor si es necesario
        // Por ejemplo, si el servidor devuelve datos actualizados, puedes extraerlos del cuerpo de la respuesta.
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw ('Error: Mal status - ${response.statusCode}');
      }
    } catch (e) {
      throw ('Error al actualizar datos de la plaga: $e');
    }
  }
}
