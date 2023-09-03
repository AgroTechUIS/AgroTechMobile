import '../models/pest_response_model.dart';

abstract class GetPestUseCase {
  Future<List<PlagaResponseModel>> getListPest({required int idCrop});
}
