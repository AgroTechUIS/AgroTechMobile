import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/variables/domain/models/variables_model.dart';

class VariablesService {
  final url = '${RouteService.routeService}/variables-agrotech';
  final ClientHttp clienthttp = ClientHttp();
}
