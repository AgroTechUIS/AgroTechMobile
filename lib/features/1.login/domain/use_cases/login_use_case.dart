import 'package:agrotech/common_utilities/models/response_model.dart';
import 'package:agrotech/features/1.login/data/data_sources/login_data_source.dart';
import 'package:agrotech/features/1.login/domain/models/login_model.dart';
import 'package:agrotech/features/1.login/domain/models/login_response_model.dart';

abstract class LoginUseCase {
  Future<ResponseModel<LoginResponseModel>> login({required LoginModel loginModel});
}

class LoginUseCaseImpl extends LoginUseCase {
  final LoginService loginService;

  LoginUseCaseImpl(
    this.loginService,
  );

  @override
  Future<ResponseModel<LoginResponseModel>> login({required LoginModel loginModel}) async {
    var response = await loginService.login(loginModel: loginModel);

    if (response.success) {
      var login = LoginResponseModel.fromJson(response.body ?? {});
      return ResponseModel<LoginResponseModel>(response: login);
    } else {
      return ResponseModel<LoginResponseModel>(error: response.message);
    }
  }
}
