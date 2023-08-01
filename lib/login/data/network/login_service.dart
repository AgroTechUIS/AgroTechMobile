import 'dart:convert';

import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/login/domain/models/login_response_model.dart';
import 'package:http/http.dart';

class LoginService {
  final url = '${RouteService.routeService}/login';

  Future<LoginResponseModel> login({required String correo, required String contrasena}) async {
    Response response;
    if (correo == "financiero@agrotech.com" && contrasena == "1234") {
      response = Response(
        '{"hash": "GHLKMFHFMGH", "token": "1234", "rol": "financiero", "message": "ok"}',
        200,
        headers: {'Content-Type': 'application/json'},
      );
    } else if (correo == "capataz@agrotech.com" && contrasena == "1234") {
      response = Response(
        '{"hash": "GHLKMFHFMGH", "token": "1234", "rol": "capataz", "message": "ok"}',
        200,
        headers: {'Content-Type': 'application/json'},
      );
    } else if (correo == "obrero@agrotech.com" && contrasena == "1234") {
      response = Response(
        '{"hash": "GHLKMFHFMGH", "token": "1234", "rol": "obrero", "message": "ok"}',
        200,
        headers: {'Content-Type': 'application/json'},
      );
    } else {
      response = Response(
        '{"hash": "", "token": "", "message": ""}',
        200,
        headers: {'Content-Type': 'application/json'},
      );
    }

    LoginResponseModel data = LoginResponseModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

    return data;
  }
}


/*try {
      var response = await http.post(
        Uri.parse(url),
        headers: await RouteService().getHeader(),
        body: login.toJson(),
      );
      String statusMessage = getStatusMessage(response.statusCode);
      if (response.statusCode == 200) {
        responseServiceModel = ResponseServiceModel(response: response, statusMessage: statusMessage);
      }
      debugPrint("Status - Loginservice - login  ${response.statusCode} $statusMessage");
    } catch (e) {
      debugPrint("Error - Loginservice - login  $e");
      responseServiceModel = ResponseServiceModel(statusMessage: e.toString());
    }*/
