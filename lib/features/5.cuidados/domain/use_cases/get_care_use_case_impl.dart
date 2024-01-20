import '../../data/network/cuidado_repository_impl.dart';
import '../models/cuidado_response_model.dart';

abstract class GetCareUseCase {
  Future<List<CareResponseModel>?> getListCare({required int idCrop});
  Future<Map<String, dynamic>> updateCare(CareResponseModel? updatedCares);
}

class GetCareUseCaseImpl extends GetCareUseCase {
  final CareRepositoryImpl careRepository;

  GetCareUseCaseImpl(
    this.careRepository,
  );

  @override
  Future<List<CareResponseModel>> getListCare({required int idCrop}) async {
    try {
      var careData = await careRepository.getCareByCrop(idCrop);
      List<CareResponseModel>? listCares = [];

      for (var entry in careData['cuidados']) {
        listCares.add(CareResponseModel.fromJson(entry));
      }
      return listCares;
    } catch (e) {
      throw ('Error al obtener la lista de cuidados: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateCare(
      CareResponseModel? updatedCares) async {
    try {
      final careData = updatedCares!.toJsonEdit();
      var r = await careRepository.updateCareDataRep(careData);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de cuidados: $e');
    }
  }

  Future<Map<String, dynamic>> saveCare(CareResponseModel? savedCares) async {
    try {
      final careData = savedCares!.toJson();
      var s = await careRepository.saveCareDataRep(careData);
      return s;
    } catch (e) {
      throw ('Error al guardar el cuidado: $e');
    }
  }

  Future<String> deleteCare(int? idCare) async {
    try {
      var d = await careRepository.deleteCaresById(idCare);
      return d;
    } catch (e) {
      throw ('Error al borrar el cuidado: $e');
    }
  }
}
