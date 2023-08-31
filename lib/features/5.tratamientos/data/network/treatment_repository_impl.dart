import 'package:agrotech/features/5.tratamientos/data/network/treatment_repository.dart';
import 'package:agrotech/features/5.tratamientos/data/network/treatment_service.dart';
import 'package:agrotech/features/5.tratamientos/domain/models/treatment_response_model.dart';

class TreatmentRepositoryImpl implements TreatmentRepository {
  final TreatmentService treatmentService;

  TreatmentRepositoryImpl(this.treatmentService);

  @override
  Future<List<TreatmentResponseModel>?> getTreatmentByPest(int idPest) async {
    return null;

    // Implementa la lógica para obtener las plagas utilizando pestService
  }
}
