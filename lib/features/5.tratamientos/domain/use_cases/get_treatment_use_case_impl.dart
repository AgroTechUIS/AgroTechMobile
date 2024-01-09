import 'package:agrotech/features/5.tratamientos/data/network/treatment_repository_impl.dart';

import '../models/treatment_response_model.dart';

abstract class GetTreatmentUseCase {
  Future<List<TreatmentResponseModel>?> getListTreatment({required int idPest});
}

class GetTreatmentUseCaseImpl extends GetTreatmentUseCase {
  final TreatmentRepository treatmentRepository;

  GetTreatmentUseCaseImpl(
    this.treatmentRepository,
  );

  @override
  Future<List<TreatmentResponseModel>> getListTreatment(
      {required int idPest}) async {
    try {
      final treatmentData =
          await treatmentRepository.getTreatmentByPest(idPest);
      List<TreatmentResponseModel> listTratamientos = [];

      for (var entry in treatmentData!['treatments']) {
        listTratamientos.add(TreatmentResponseModel.fromJson(entry));
      }
      return listTratamientos;
    } catch (e) {
      throw ('Error al obtener la lista de tratamientos: $e');
    }
  }

  Future<Map<String, dynamic>> updateTreatment(
      TreatmentResponseModel? updateTreatments) async {
    try {
      final treatmentData = updateTreatments!.toJson();
      var r = await treatmentRepository.updateTreatmentDataRep(treatmentData);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de tratamientos: $e');
    }
  }

  Future<Map<String, dynamic>> saveTreatment(
      TreatmentResponseModel? savedTreatments) async {
    try {
      final treatmentData = savedTreatments!.toJsonPost();
      var s = await treatmentRepository.saveTreatmentDataRep(treatmentData);
      return s;
    } catch (e) {
      throw ('Error al guardar el tratamiento: $e');
    }
  }

  Future<String> deleteTreatment(int? idTreatment) async {
    try {
      var d = await treatmentRepository.deleteTreatmentsById(idTreatment);
      return d;
    } catch (e) {
      throw ('Error al borrar el tratamiento: $e');
    }
  }
}
