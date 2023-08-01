import 'package:agrotech/home/presentation/home_page.dart';
import 'package:agrotech/login/data/network/login_service.dart';
import 'package:agrotech/login/domain/models/login_response_model.dart';
import 'package:http/http.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

class LoginUseCase {
  final LoginService loginService;

  LoginUseCase({
    required this.loginService,
  });

  Future<UserRol> login({required String correo, required String contrasena}) async {
    var response = await loginService.login(correo: correo, contrasena: contrasena);

    LoginResponseModel login = response;
    if (response.message == "ok") {
      var pref = await SecureSharedPref.getInstance();
      pref.putString("hash", login.hash!);
      pref.putString("token", login.token!);
      switch (login.rol) {
        case 'financiero':
          return UserRol.financiero;
        case 'capataz':
          return UserRol.capataz;
        case 'obrero':
          return UserRol.obrero;
        default:
          return UserRol.lock;
      }
    } else {
      return UserRol.lock;
    }
  }
}
