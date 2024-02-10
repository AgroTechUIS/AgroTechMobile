// coverage:ignore-file
import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

import '../../../../common_utilities/httpDeleteModel.dart';
import '../../domain/models/measure_response_model.dart';

class MeasureService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> saveMeasure(Map<String, dynamic> measureModel) async {
    return clienthttp.post(url: '${RouteService.routeService}/api/variable-value', body: measureModel);
  }

  Future<HttpResponseModel> getMeasures(int idVariable) async {
    return clienthttp.get(url: '${RouteService.routeService}/api/variable-value/$idVariable');
  }

  Future<HttpResponseModel> updateMeasureData(Map<String, dynamic> measureData) async {
    final response = await clienthttp.put(
      url: '${RouteService.routeService}/api/variable-value', // Ruta sin el cropId
      body: measureData,
    );
    return response;
  }

  Future<HttpDeleteModel> deleteMeasureData(int? idMeasure) async {
    final response = await clienthttp.delete(url: '${RouteService.routeService}/api/variable-value/$idMeasure');
    return response;
  }
}
