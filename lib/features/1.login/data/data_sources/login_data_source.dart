import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/features/1.login/domain/models/login_model.dart';

class LoginService {
  final url = '${RouteService.routeService}/api/auth/login';
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> login({required LoginModel loginModel}) async {
    return clienthttp.post(url: url, body: loginModel.toJson());
  }
}
