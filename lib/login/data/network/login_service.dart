import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/login/domain/models/login_model.dart';

class LoginService {
  final url = '${RouteService.routeService}/login-agrotech';
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> login({required LoginModel loginModel}) async {
    return clienthttp.post(url: url, body: loginModel.toJson());
  }
}
