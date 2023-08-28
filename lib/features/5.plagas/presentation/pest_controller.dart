import 'package:agrotech/features/1.login/data/network/login_service.dart';
import 'package:agrotech/features/1.login/domain/models/login_model.dart';
import 'package:agrotech/features/1.login/domain/models/login_response_model.dart';
import 'package:agrotech/features/1.login/domain/use_cases/login_use_case.dart';
import 'package:agrotech/features/1.login/presentation/login_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

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

  Future<LoginResponseModel> login() async {
    var resp = await loginUseCaseImpl.login(
        loginModel: LoginModel(
            email: emailController.text, password: passwordController.text));
    state = state.copyWith(
      idusuario: resp.idusuario,
      nombre: resp.nombre,
      cedula: resp.cedula,
      correo: resp.correo,
      telefono: resp.telefono,
      rol: resp.rol,
      ingreso: resp.ingreso,
    );
    return resp;
  }
}

final loginController = StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(LoginUseCaseImpl(LoginService())),
);
