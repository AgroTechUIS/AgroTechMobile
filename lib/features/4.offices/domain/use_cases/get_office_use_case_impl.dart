import '../../data/office_repository_impl.dart';
import '../models/office_model.dart';

abstract class GetOfficeUseCase {
  Future<List<OfficeModel>> getListOffice({required int idEmpresa});
  Future<Map<String, dynamic>> updateOffice(OfficeModel? updatedDespachos);
}

class GetOfficeUseCaseImpl extends GetOfficeUseCase {
  final OfficeRepositoryImpl officeRepository;

  GetOfficeUseCaseImpl(
    this.officeRepository,
  );

  @override
  Future<List<OfficeModel>> getListOffice({required int idEmpresa}) async {
    try {
      var officeData = await officeRepository.getOfficesByEmpresa(idEmpresa);
      List<OfficeModel>? listDespachos = [];

      for (var entry in officeData['shipments']) {
        listDespachos.add(OfficeModel.fromJson(entry));
      }
      return listDespachos;
    } catch (e) {
      throw ('Error al obtener la lista de despachos: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateOffice(
      OfficeModel? updatedDespachos) async {
    try {
      final officeData = updatedDespachos!.toJson();
      var r = await officeRepository.updateOfficesDataRep(
          officeData, updatedDespachos.id!);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de despachos: $e');
    }
  }
}
