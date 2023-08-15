import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/user_model.dart';

class ListCropsDataSource {
  final url = '${RouteService.routeService}/actividades-obrero';
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> loadCrops({required UserModel userModel}) async {
    return clienthttp.post(url: url, body: userModel.toJson());
  }
}
