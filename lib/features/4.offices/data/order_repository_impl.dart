import 'order_service.dart';

abstract class OfficeRepository {
  Future<Map<String, dynamic>> getOfficesByEmpresa(int idCrop); // ??

  Future<Map<String, dynamic>> updateOfficesDataRep(
      Map<String, dynamic> officeData, int idOffice);
}

class OfficeRepositoryImpl implements OfficeRepository {
  final OfficeService officeService;

  OfficeRepositoryImpl(this.officeService);

  @override
  Future<Map<String, dynamic>> getOfficesByEmpresa(int idEmpresa) async {
    try {
      final officeData = await officeService.getOffices(idEmpresa: idEmpresa);
      if (officeData.success) {
        return officeData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de los despachos: $e');
    }
  }

  Future<Map<String, dynamic>> updateOfficesDataRep(
      Map<String, dynamic> officeData, int idOffice) async {
    try {
      final response =
          await officeService.updateOfficeData(officeData, idOffice);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al actualizar datos del despacho: $e');
    }
  }
}
