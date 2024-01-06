import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

import '../../domain/models/measure_response_model.dart';

class MeasureService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> saveTreatment(
      {required MeasureResponseModel medidaModel}) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/variable/medida',
        body: medidaModel.toJson());
  }

  Future<HttpResponseModel> getMedidas({required int idVariable}) async {
    return clienthttp.get(
        url: '${RouteService.routeService}/variable/medida/$idVariable');
  }
}
