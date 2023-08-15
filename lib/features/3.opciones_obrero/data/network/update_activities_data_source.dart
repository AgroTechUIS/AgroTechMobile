import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/update_activity_model.dart';

class UpdateActivitiesDataSource {
  final url = '${RouteService.routeService}/actualizar-actividad-obrero';
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> updateActivities({required UpdateActivityModel updateActivityModel}) async {
    return clienthttp.post(url: url, body: updateActivityModel.toJson());
  }
}
