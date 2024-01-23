import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/features/1.login/data/data_sources/login_data_source.dart';
import 'package:agrotech/features/1.login/domain/models/login_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationsDataSourceImpl', () {
    LoginService loginService = LoginService();

    test('login() function test', () async {
      var login = await loginService.login(loginModel: LoginModel());
      expect(login, isInstanceOf<HttpResponseModel>());
    });
  });
}
