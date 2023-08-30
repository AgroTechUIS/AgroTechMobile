import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

import '../../domain/models/treatment_response_model.dart';

class TreatmentService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> saveTreatment(
      {required TreatmentResponseModel treatmentModel}) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/treatment',
        body: treatmentModel.toJson());
  }

  Future<HttpResponseModel> getTreatments({required int idPest}) async {
    return clienthttp.get(
        url: '${RouteService.routeService}/treatment/$idPest');
  }
}
