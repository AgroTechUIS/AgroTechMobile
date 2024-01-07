import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

import '../../../../common_utilities/httpDeleteModel.dart';
import '../../domain/models/crop_response_model.dart';

class CropService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> saveCrop(
      {required CropResponseModel cropModel}) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/crops', body: cropModel.toJson());
  }

  Future<HttpResponseModel> getCrops({required int idEmpresa}) async {
    final response = await clienthttp.get(
        url: '${RouteService.routeService}/api/crop/$idEmpresa');

    return response;
  }

  Future<HttpResponseModel> saveCropData(Map<String, dynamic> cropData) async {
    final response = await clienthttp.post(
        url: '${RouteService.routeService}/api/crop', body: cropData);
    return response;
  }

  Future<HttpResponseModel> updateCropData(
      Map<String, dynamic> cropData) async {
    final response = await clienthttp.put(
      url: '${RouteService.routeService}/api/crop', // Ruta sin el cropId
      body: cropData,
    );
    return response;
  }

  Future<HttpDeleteModel> deleteCropData(int? idCrop) async {
    final response = await clienthttp.delete(
        url: '${RouteService.routeService}/api/crop/$idCrop');
    return response;
  }
}
