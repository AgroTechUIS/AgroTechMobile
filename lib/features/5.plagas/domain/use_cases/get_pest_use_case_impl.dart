import '../../data/network/pest_repository.dart';
import '../models/pest_response_model.dart';
import 'get_pest_use_case.dart';

class GetPestUseCaseImpl extends GetPestUseCase {
  final PestRepository pestRepository;

  GetPestUseCaseImpl(
    this.pestRepository,
  );

  @override
  Future<List<PlagaResponseModel>?> getListPest({required int idCrop}) async {
    return await pestRepository.getPestByCrop(idCrop);
    /*var response = await pestService.getPestByCrop(idCrop: idCrop);

    if (response.success) {
      var listaPlagas = listplagaFromJson(response.body as List);

      return listaPlagas;
    } else {
      return null;
    }*/
  }
}
