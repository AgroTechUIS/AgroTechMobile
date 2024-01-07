import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpDeleteModel.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

import '../../domain/models/treatment_response_model.dart';

class TreatmentService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> saveTreatment(
      Map<String, dynamic> treatmentModel) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/treatment', body: treatmentModel);
  }

  Future<HttpResponseModel> getTreatments(int idPest) async {
    return clienthttp.get(
        url: '${RouteService.routeService}/api/treatment/$idPest');
  }

  Future<HttpResponseModel> updateTreatmentData(
      Map<String, dynamic> treatmentData) async {
    final response = await clienthttp.put(
      url: '${RouteService.routeService}/api/treatment', // Ruta sin el cropId
      body: treatmentData,
    );
    return response;
  }

  Future<HttpDeleteModel> deleteTreatmentData(int? idTreatment) async {
    final response = await clienthttp.delete(
        url: '${RouteService.routeService}/api/treatment/$idTreatment');
    return response;
  }
}
