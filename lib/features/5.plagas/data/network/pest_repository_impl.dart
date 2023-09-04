import 'package:agrotech/features/5.plagas/data/network/pest_service.dart';

abstract class PestRepository {
  Future<Map<String, dynamic>> getPestsByCrop(int idCrop);
}

class PestRepositoryImpl implements PestRepository {
  final PestService pestService;

  PestRepositoryImpl(this.pestService);

  @override
  Future<Map<String, dynamic>> getPestsByCrop(int idCrop) async {
    try {
      final pestData = await pestService.getPestData(idCrop);
      if (pestData.success) {
        return pestData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de las plagas: $e');
    }
  }
}
