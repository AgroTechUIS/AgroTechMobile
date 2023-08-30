import 'package:agrotech/features/5.plagas/data/network/pest_service.dart';
import 'package:agrotech/features/5.plagas/domain/models/pest_model.dart';
import 'package:agrotech/features/5.tratamientos/domain/models/treatment_response_model.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

abstract class GetTreatmentUseCase {
  Future<List<TreatmentResponseModel>?> getListPest({required int idCrop});
}

class GetPestUseCaseImpl extends GetTreatmentUseCase {
  final PestService treatmentService;

  GetPestUseCaseImpl(
    this.treatmentService,
  );

  @override
  Future<List<TreatmentResponseModel>?> getListPest({required int idCrop}) {
    // TODO: implement getListPest
    throw UnimplementedError();
  }
}
