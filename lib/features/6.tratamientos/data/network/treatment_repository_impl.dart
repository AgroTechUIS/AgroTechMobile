// coverage:ignore-file
import 'package:agrotech/features/6.tratamientos/data/network/treatment_service.dart';
import 'package:agrotech/features/6.tratamientos/domain/models/treatment_response_model.dart';

abstract class TreatmentRepository {
  Future<Map<String, dynamic>?> getTreatmentByPest(int idPest);
  Future<Map<String, dynamic>> updateTreatmentDataRep(Map<String, dynamic> treatmentData);
  Future<Map<String, dynamic>> saveTreatmentDataRep(Map<String, dynamic> treatmentData);
  Future<String> deleteTreatmentsById(int? idTreatment);
}

class TreatmentRepositoryImpl implements TreatmentRepository {
  final TreatmentService treatmentService;

  TreatmentRepositoryImpl(this.treatmentService);

  @override
  Future<Map<String, dynamic>?> getTreatmentByPest(int idPest) async {
    try {
      final treatmentData = await treatmentService.getTreatments(idPest);
      if (treatmentData.success) {
        return treatmentData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de los tratamientos: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateTreatmentDataRep(Map<String, dynamic> treatmentData) async {
    try {
      final response = await treatmentService.updateTreatmentData(treatmentData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al actualizar datos del tratamiento: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> saveTreatmentDataRep(Map<String, dynamic> treatmentData) async {
    try {
      final response = await treatmentService.saveTreatment(treatmentData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al guardar datos del tratamiento: $e');
    }
  }

  @override
  Future<String> deleteTreatmentsById(int? idTreatment) async {
    try {
      final treatmentData = await treatmentService.deleteTreatmentData(idTreatment);
      if (treatmentData.success) {
        return treatmentData.message ?? 'Tratamiento borrado';
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al borrar datos del tratamiento: $e');
    }
  }
}
