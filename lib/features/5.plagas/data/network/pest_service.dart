import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

import '../../domain/models/pest_response_model.dart';

class PestService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> savePest(
      {required PlagaResponseModel plagaModel}) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/plagas', body: plagaModel.toJson());
  }

  Future<HttpResponseModel> getPestByCrop({required int idCrop}) async {
    return clienthttp.get(url: '${RouteService.routeService}/plagas/$idCrop');
  }
}
