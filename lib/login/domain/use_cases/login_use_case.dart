import 'package:agrotech/login/data/network/login_service.dart';
import 'package:agrotech/login/domain/models/login_model.dart';
import 'package:agrotech/login/domain/models/login_response_model.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

abstract class LoginUseCase {
  Future<LoginResponseModel> login({required LoginModel loginModel});
}

class LoginUseCaseImpl extends LoginUseCase {
  final LoginService loginService;

  LoginUseCaseImpl(
    this.loginService,
  );

  @override
  Future<LoginResponseModel> login({required LoginModel loginModel}) async {
    var response = await loginService.login(loginModel: loginModel);

    if (response.success) {
      var login = LoginResponseModel.fromJson(response.body ?? {});
      var pref = await SecureSharedPref.getInstance();
      pref.putString("hash", login.hash!);
      pref.putString("token", login.token!);
      return login;
    } else {
      return LoginResponseModel(error: 'login:success:false');
    }
  }
}
