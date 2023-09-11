import 'package:agrotech/features/5.plagas/data/network/pest_repository_impl.dart';
import 'package:agrotech/features/5.plagas/domain/models/pest_response_model.dart';

abstract class GetPestUseCase {
  Future<List<PlagaResponseModel>> getListPest({required int idCrop});
  Future<Map<String, dynamic>> updatePest(PlagaResponseModel? updatedPlagas);
}

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
        listPlagas.add(PlagaResponseModel.fromJson(entry));
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

  @override
  Future<Map<String, dynamic>> updatePest(
      PlagaResponseModel? updatedPlagas) async {
    try {
      final pestData = updatedPlagas!.toJson();
      var r = await pestRepository.updatePestDataRep(pestData);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de plagas: $e');
    }
  }

  Future<Map<String, dynamic>> savePest(PlagaResponseModel? savedPlagas) async {
    try {
      final pestData = savedPlagas!.toJson();
      var s = await pestRepository.savePestDataRep(pestData);
      return s;
    } catch (e) {
      throw ('Error al guardar la plaga: $e');
    }
  }
}
