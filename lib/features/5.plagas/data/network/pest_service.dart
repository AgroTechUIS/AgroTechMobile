import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

class PestService {
  final ClientHttp clienthttp = ClientHttp();

  PestService();

  Future<HttpResponseModel> getPestData(int cropId) async {
    final response = await clienthttp.get(url: '${RouteService.routeService}/api/pests/$cropId');

    return response;
  }

  /*
  Future<HttpResponseModel> savePest(
      {required PlagaResponseModel plagaModel}) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/plagas', body: plagaModel.toJson());
  }

  Future<HttpResponseModel> getPestByCrop({required int idCrop}) async {
    return clienthttp.get(url: '${RouteService.routeService}/plagas/$idCrop');
  }
*/
}
