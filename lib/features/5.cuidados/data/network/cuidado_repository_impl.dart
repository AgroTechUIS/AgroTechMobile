// coverage:ignore-file
import 'package:agrotech/features/5.cuidados/data/network/cuidado_service.dart';
import 'package:agrotech/features/5.cuidados/domain/models/cuidado_response_model.dart';

import 'cuidado_repository.dart';

class CareRepositoryImpl implements CareRepository {
  final CareService pestService;

  CareRepositoryImpl(this.pestService);

  @override
  Future<List<CareResponseModel>?> getCareByCrop(int idCrop) async {
    return null;

    // Implementa la lógica para obtener las plagas utilizando pestService
  }
}
