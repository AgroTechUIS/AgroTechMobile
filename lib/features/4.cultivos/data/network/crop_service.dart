import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

import '../../domain/models/crop_response_model.dart';

class CropService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> saveCrop(
      {required CropResponseModel cropModel}) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/crops', body: cropModel.toJson());
  }

  Future<HttpResponseModel> getCrops({required int idCrop}) async {
    idCrop = 1;
    return clienthttp.get(url: '${RouteService.routeService}/plagas/$idCrop');
  }
}
