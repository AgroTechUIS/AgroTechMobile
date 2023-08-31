import 'package:agrotech/features/6.medidas/data/network/measure_repository.dart';
import 'package:agrotech/features/6.medidas/data/network/measure_service.dart';

import '../../domain/models/measure_response_model.dart';

class MeasureRepositoryImpl implements MeasureRepository {
  final MeasureService measureService;

  MeasureRepositoryImpl(this.measureService);

  @override
  Future<List<MeasureResponseModel>?> getMeasureByVariable(
      int idVariable) async {
    return null;

    // Implementa la lógica para obtener las plagas utilizando pestService
  }
}
