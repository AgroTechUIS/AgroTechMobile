import 'package:agrotech/features/5.plagas/data/network/pest_repository.dart';
import 'package:agrotech/features/5.plagas/data/network/pest_service.dart';

import '../../domain/models/pest_response_model.dart';

class PestRepositoryImpl implements PestRepository {
  final PestService pestService;

  PestRepositoryImpl(this.pestService);

  @override
  Future<Map<String, dynamic>> getPestsByCrop(int idCrop) async {
    final apiService = PestService('http://3.81.168.53:8080');

    try {
      final pestData = await apiService.getPestData(idCrop);
      return pestData;
    } catch (e) {
      throw ('Error al obtener datos de las plagas: $e');
    }
  }
}
