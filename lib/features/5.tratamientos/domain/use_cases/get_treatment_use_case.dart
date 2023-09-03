import '../models/treatment_response_model.dart';

abstract class GetTreatmentUseCase {
  Future<List<TreatmentResponseModel>?> getListTreatment({required int idCrop});
}
