import 'package:agrotech/features/5.tratamientos/data/network/treatment_repository_impl.dart';

import '../models/treatment_response_model.dart';
import 'get_treatment_use_case.dart';

abstract class GetTreatmentUseCase {
  Future<List<TreatmentResponseModel>?> getListTreatment({required int idCrop});
}

class GetPestUseCaseImpl extends GetTreatmentUseCase {
  final TreatmentRepository treatmentRepository;

  GetPestUseCaseImpl(
    this.treatmentRepository,
  );

  @override
  getListTreatment({required int idCrop}) {
    // TODO: implement getListPest
    throw UnimplementedError();
  }
}
