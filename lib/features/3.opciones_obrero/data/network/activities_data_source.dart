// coverage:ignore-file
import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/update_activity_model.dart';

class ActivitiesDataSource {
  final url = '${RouteService.routeService}/api/actividades/';
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> loadActivities({required String user}) async {
    return clienthttp.get(url: '$url/usuario/$user');
  }

  Future<HttpResponseModel> updateActivities({required UpdateActivityModel updateActivityModel}) async {
    return clienthttp.put(url: url, body: updateActivityModel.toJson());
  }
}
