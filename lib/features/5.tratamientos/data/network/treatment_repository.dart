import 'package:agrotech/features/5.tratamientos/domain/models/treatment_response_model.dart';

abstract class TreatmentRepository {
  Future<List<TreatmentResponseModel>?> getTreatmentByPest(int idPest);
}
