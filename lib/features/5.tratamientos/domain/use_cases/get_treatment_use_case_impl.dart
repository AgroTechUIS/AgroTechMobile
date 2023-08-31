import 'package:agrotech/features/5.tratamientos/data/network/treatment_repository.dart';

import '../../../5.plagas/data/network/pest_service.dart';
import '../models/treatment_response_model.dart';
import 'get_treatment_use_case.dart';

class GetPestUseCaseImpl extends GetTreatmentUseCase {
  final TreatmentRepository treatmentRepository;

  GetPestUseCaseImpl(
    this.treatmentRepository,
  );

  @override
  Future<List<TreatmentResponseModel>?> getListPest({required int idCrop}) {
    // TODO: implement getListPest
    throw UnimplementedError();
  }
}
