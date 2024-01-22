import '../../../common_utilities/clientHttp.dart';
import '../../../common_utilities/httpDeleteModel.dart';
import '../../../common_utilities/httpResponseModel.dart';
import '../../../common_utilities/route_service.dart';
import '../domain/models/office_model.dart';

class OfficeService {
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> getOffices({required int idEmpresa}) async {
    final response = await clienthttp.get(
        url:
            '${RouteService.routeService}/api/store/saleDetail/shipment/$idEmpresa');

    return response;
  }

  Future<HttpResponseModel> updateOfficeData(
      Map<String, dynamic> officeData, int idOffice) async {
    final response = await clienthttp.put(
      url:
          '${RouteService.routeService}/api/store/saleDetail/update/shipment/$idOffice', // Ruta sin el cropId
      body: officeData,
    );
    return response;
  }
}
