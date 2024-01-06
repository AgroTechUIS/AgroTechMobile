import '../models/cuidado_response_model.dart';

abstract class GetCareUseCase {
  Future<List<CareResponseModel>?> getListCare({required int idCrop});
}
