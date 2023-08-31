import 'package:agrotech/features/5.plagas/data/network/pest_repository.dart';
import 'package:agrotech/features/5.plagas/data/network/pest_service.dart';

import '../../domain/models/pest_response_model.dart';

class PestRepositoryImpl implements PestRepository {
  final PestService pestService;

  PestRepositoryImpl(this.pestService);

  @override
  Future<List<PlagaResponseModel>?> getPestByCrop(int idCrop) async {
    return null;

    // Implementa la lógica para obtener las plagas utilizando pestService
  }
}
