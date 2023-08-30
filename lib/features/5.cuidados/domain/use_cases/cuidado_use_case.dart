import 'package:agrotech/features/5.cuidados/data/network/cuidado_service.dart';
import 'package:agrotech/features/5.cuidados/domain/models/cuidado_response_model.dart';
import 'package:agrotech/features/5.plagas/data/network/pest_service.dart';
import 'package:agrotech/features/5.plagas/domain/models/pest_model.dart';
import 'package:agrotech/features/5.tratamientos/domain/models/treatment_response_model.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

abstract class GetCareUseCase {
  Future<List<CareResponseModel>?> getListCare({required int idPest});
}

class GetCareUseCaseImpl extends GetCareUseCase {
  final CareService careService;

  GetCareUseCaseImpl(
    this.careService,
  );

  @override
  Future<List<CareResponseModel>?> getListCare({required int idPest}) {
    // TODO: implement getListPest
    throw UnimplementedError();
  }
}
