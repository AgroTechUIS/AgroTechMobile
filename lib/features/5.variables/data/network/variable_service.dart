import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

import '../../../../common_utilities/httpDeleteModel.dart';
import '../../domain/models/variable_response_model.dart';

class VariableService {
  final ClientHttp clienthttp = ClientHttp();

  VariableService();

  Future<HttpResponseModel> getVariableData(int cropId) async {
    final response = await clienthttp.get(
        url: '${RouteService.routeService}/api/variable/$cropId');

    return response;
  }

  Future<HttpResponseModel> updateVariableData(
      Map<String, dynamic> variableData) async {
    final response = await clienthttp.put(
      url: '${RouteService.routeService}/api/variable', // Ruta sin el cropId
      body: variableData,
    );
    return response;
  }

  Future<HttpResponseModel> saveVariableData(
      Map<String, dynamic> variableData) async {
    final response = await clienthttp.post(
        url: '${RouteService.routeService}/api/variable', body: variableData);
    return response;
  }

  Future<HttpDeleteModel> deleteVariableData(int? idVariable) async {
    final response = await clienthttp.delete(
        url: '${RouteService.routeService}/api/variable/$idVariable');
    return response;
  }
}
