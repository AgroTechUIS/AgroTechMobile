import 'package:agrotech/in_admin/data/network/in_admin_service.dart';
import 'package:agrotech/in_admin/domain/models/in_admin_model.dart';
import 'package:agrotech/login/domain/models/login_response_model.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

abstract class LoginUseCase {
  Future<LoginResponseModel> login({required InAdminModel loginModel});
}
