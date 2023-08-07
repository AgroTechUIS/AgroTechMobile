import 'package:agrotech/home/presentation/home_page.dart';
import 'package:agrotech/signup/data/network/signup_service.dart';
import 'package:agrotech/signup/domain/models/signup_response_model.dart';
import 'package:http/http.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

class SignUpUseCase {
  final SignUpService signupService;

  SignUpUseCase({
    required this.signupService,
  });
}
