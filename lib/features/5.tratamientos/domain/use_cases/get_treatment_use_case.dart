import '../models/treatment_response_model.dart';

abstract class GetTreatmentUseCase {
  Future<List<TreatmentResponseModel>?> getListPest({required int idCrop});
}
