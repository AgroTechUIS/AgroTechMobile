import 'package:agrotech/features/5.plagas/data/network/pest_service.dart';
import 'package:agrotech/features/5.plagas/domain/models/pest_model.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';
import '../models/pest_response_model.dart';

abstract class GetPestUseCase {
  Future<List<PlagaResponseModel>?> getListPest({required int idCrop});
}

class GetPestUseCaseImpl extends GetPestUseCase {
  final PestService pestService;

  GetPestUseCaseImpl(
    this.pestService,
  );

  @override
  Future<List<PlagaResponseModel>?> getListPest({required int idCrop}) async {
    var response = await pestService.getPestByCrop(idCrop: idCrop);

    if (response.success) {
      var listaPlagas = listplagaFromJson(response.body as List);

      return listaPlagas;
    } else {
      return null;
    }
  }
}
