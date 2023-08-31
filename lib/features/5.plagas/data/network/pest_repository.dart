import '../../domain/models/pest_response_model.dart';

abstract class PestRepository {
  Future<List<PlagaResponseModel>?> getPestByCrop(int idCrop);
}
