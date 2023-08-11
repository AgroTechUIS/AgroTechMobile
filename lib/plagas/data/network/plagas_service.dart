import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/plagas/domain/models/plagas_model.dart';

class PlagasService {
  final url = '${RouteService.routeService}/plagas-agrotech';
  final ClientHttp clienthttp = ClientHttp();
}
