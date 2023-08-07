import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/in_admin/domain/models/in_admin_model.dart';

class InAdminService {
  final url = '${RouteService.routeService}/in_admin-agrotech';
  final ClientHttp clienthttp = ClientHttp();
}
