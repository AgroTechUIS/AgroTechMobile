import 'package:agrotech/features/5.cuidados/data/network/cuidado_repository.dart';

import '../models/cuidado_response_model.dart';
import 'get_care_use_case.dart';

class GetCareUseCaseImpl extends GetCareUseCase {
  final CareRepository careRepository;

  GetCareUseCaseImpl(
    this.careRepository,
  );

  @override
  Future<List<CareResponseModel>?> getListCare({required int idCrop}) {
    // TODO: implement getListPest
    throw UnimplementedError();
  }
}
