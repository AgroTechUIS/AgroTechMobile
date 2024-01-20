import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

import '../../../../common_utilities/httpDeleteModel.dart';
import '../../domain/models/cuidado_response_model.dart';

class CareService {
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> getCares(int idCrop) async {
    final response = await clienthttp.get(
        url: '${RouteService.routeService}/api/care/$idCrop');

    return response;
  }

  Future<HttpResponseModel> updateCareData(
      Map<String, dynamic> careData) async {
    final response = await clienthttp.put(
      url: '${RouteService.routeService}/api/care', // Ruta sin el cropId
      body: careData,
    );
    return response;
  }

  Future<HttpResponseModel> saveCareData(Map<String, dynamic> careData) async {
    final response = await clienthttp.post(
        url: '${RouteService.routeService}/api/care', body: careData);
    return response;
  }

  Future<HttpDeleteModel> deleteCareData(int? idCare) async {
    final response = await clienthttp.delete(
        url: '${RouteService.routeService}/api/care/$idCare');
    return response;
  }
}
