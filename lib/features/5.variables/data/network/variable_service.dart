import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

import '../../domain/models/variable_response_model.dart';

class VariableService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> saveTreatment(
      {required VariableResponseModel variableModel}) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/variable',
        body: variableModel.toJson());
  }

  Future<HttpResponseModel> getVariables({required int idCrop}) async {
    return clienthttp.get(url: '${RouteService.routeService}/variable/$idCrop');
  }
}
