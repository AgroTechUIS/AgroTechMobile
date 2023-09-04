import '../../data/network/pest_repository.dart';
import '../../data/network/pest_repository_impl.dart';
import '../models/pest_response_model.dart';
import 'get_pest_use_case.dart';
import '../models/pest_response_model.dart';

class GetPestUseCaseImpl extends GetPestUseCase {
  final PestRepositoryImpl pestRepository;

  GetPestUseCaseImpl(
    this.pestRepository,
  );

  @override
  Future<List<PlagaResponseModel>> getListPest({required int idCrop}) async {
    try {
      final pestData = await pestRepository.getPestsByCrop(idCrop);
      List<PlagaResponseModel> listPlagas = [];

      for (var entry in pestData['pests']) {
        listPlagas.add(PlagaResponseModel.fromJson(entry.value));
      }
      return listPlagas;
    } catch (e) {
      throw ('Error al obtener la lista de plagas: $e');
    }

    /*var response = await pestService.getPestByCrop(idCrop: idCrop);

    if (response.success) {
      var listaPlagas = listplagaFromJson(response.body as List);

      return listaPlagas;
    } else {
      return null;
    }*/
  }
}
