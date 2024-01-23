// coverage:ignore-file
import 'package:agrotech/features/6.medidas/data/network/measure_service.dart';

import '../../domain/models/measure_response_model.dart';

abstract class MeasureRepository {
  Future<Map<String, dynamic>?> getMeasureByVariable(int idVariable);
  Future<Map<String, dynamic>> updateMeasureDataRep(Map<String, dynamic> measureData);
  Future<Map<String, dynamic>> saveMeasureDataRep(Map<String, dynamic> measureData);
  Future<String> deleteMeasuresById(int? idMeasure);
}

class MeasureRepositoryImpl implements MeasureRepository {
  final MeasureService measureService;

  MeasureRepositoryImpl(this.measureService);

  @override
  Future<Map<String, dynamic>?> getMeasureByVariable(int idVariable) async {
    try {
      final measureData = await measureService.getMeasures(idVariable);
      if (measureData.success) {
        return measureData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de las medidas: $e');
    }
  }

  Future<Map<String, dynamic>> updateMeasureDataRep(Map<String, dynamic> measureData) async {
    try {
      final response = await measureService.updateMeasureData(measureData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al actualizar datos de las medidas: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> saveMeasureDataRep(Map<String, dynamic> measureData) async {
    try {
      final response = await measureService.saveMeasure(measureData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al guardar datos de la medida: $e');
    }
  }

  @override
  Future<String> deleteMeasuresById(int? idMeasure) async {
    try {
      final treatmentData = await measureService.deleteMeasureData(idMeasure);
      if (treatmentData.success) {
        return treatmentData.message ?? 'Medida borrada';
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al borrar datos de la medida: $e');
    }
  }
}
