import '../../domain/models/pest_response_model.dart';

abstract class PestRepository {
  Future<Map<String, dynamic>> getPestsByCrop(int idCrop);
}
