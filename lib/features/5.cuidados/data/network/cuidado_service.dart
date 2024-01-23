// coverage:ignore-file
import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

import '../../domain/models/cuidado_response_model.dart';

class CareService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> saveCare({required CareResponseModel careModel}) async {
    return clienthttp.post(url: '${RouteService.routeService}/crops', body: careModel.toJson());
  }

  Future<HttpResponseModel> getCares({required int idPest}) async {
    return clienthttp.get(url: '${RouteService.routeService}/cuidados/$idPest');
  }
}
