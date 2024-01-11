import '../../../common_utilities/clientHttp.dart';
import '../../../common_utilities/httpDeleteModel.dart';
import '../../../common_utilities/httpResponseModel.dart';
import '../../../common_utilities/route_service.dart';

class ShippingService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> saveShipping(
      Map<String, dynamic> treatmentModel) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/api/store/addressShipping',
        body: treatmentModel);
  }

  Future<HttpResponseModel> getShippings(int idEmpresa) async {
    return clienthttp.get(
        url:
            '${RouteService.routeService}/api/store/addressShipping/$idEmpresa');
  }

  Future<HttpResponseModel> updateShippingData(
      Map<String, dynamic> treatmentData) async {
    final response = await clienthttp.put(
      url:
          '${RouteService.routeService}/api/store/addressShipping', // Ruta sin el cropId
      body: treatmentData,
    );
    return response;
  }

  Future<HttpDeleteModel> deleteShippingData(int? idEnvio) async {
    final response = await clienthttp.delete(
        url: '${RouteService.routeService}/api/store/addressShipping/$idEnvio');
    return response;
  }
}
