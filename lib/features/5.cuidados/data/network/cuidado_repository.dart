// coverage:ignore-file
import '../../domain/models/cuidado_response_model.dart';

abstract class CareRepository {
  Future<List<CareResponseModel>?> getCareByCrop(int idCrop);
}
