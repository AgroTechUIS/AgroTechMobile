import 'package:agrotech/home/presentation/home_page.dart';
import 'package:agrotech/login/data/network/login_service.dart';
import 'package:agrotech/login/domain/models/login_model.dart';
import 'package:agrotech/login/domain/models/login_response_model.dart';
import 'package:agrotech/login/domain/use_cases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

/*final loginUseCaseProvider = Provider<LoginUseCase>((ref) => LoginUseCase(loginService: LoginService()));
final correoProvider = StateProvider<TextEditingController>((ref) => TextEditingController());
final contrasenaProvider = StateProvider<TextEditingController>((ref) => TextEditingController());
final isLoggedProvider = StateProvider<bool>((ref) => false);

Future<UserRol> loginOk(TextEditingController emailcontroller, TextEditingController passwordController) async {
  final ref = ProviderContainer();
  final servicioAutenticacion = ref.listen(loginUseCaseProvider, (previous, next) {});

  UserRol response =
      await servicioAutenticacion.read().login(correo: emailcontroller.value.text, contrasena: passwordController.text);

  return response;
}*/

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.loginUseCaseImpl) : super(LoginState());

  // Use cases
  final LoginUseCaseImpl loginUseCaseImpl;

  // Textfields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  TextEditingController getEmailController() {
    return emailController;
  }

  TextEditingController getPasswordController() {
    return passwordController;
  }

  Future<LoginResponseModel> login(String email, String password) async {
    return await loginUseCaseImpl.login(loginModel: LoginModel(email: email, password: password));
  }
}

final loginController = StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(LoginUseCaseImpl(LoginService())),
);

class LoginState {
  final String dynamicCode;
  final int bannedTime;

  LoginState({
    this.dynamicCode = "",
    this.bannedTime = 1,
  });

  LoginState copyWith({
    String? dynamicCode,
    int? bannedTime,
  }) {
    return LoginState(
      dynamicCode: dynamicCode ?? this.dynamicCode,
      bannedTime: bannedTime ?? this.bannedTime,
    );
  }
}
