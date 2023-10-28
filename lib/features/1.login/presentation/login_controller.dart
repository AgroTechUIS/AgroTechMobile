import 'package:agrotech/common_utilities/controllers/offline_controller.dart';
import 'package:agrotech/common_utilities/models/response_model.dart';
import 'package:agrotech/features/1.login/data/data_sources/login_data_source.dart';
import 'package:agrotech/features/1.login/domain/models/login_model.dart';
import 'package:agrotech/features/1.login/domain/models/login_response_model.dart';
import 'package:agrotech/features/1.login/domain/use_cases/login_use_case.dart';
import 'package:agrotech/features/1.login/presentation/login_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(
    this.loginUseCaseImpl,
    //this.online,
    //this.onlineController,
  ) : super(LoginState());

  // Use cases
  final LoginUseCaseImpl loginUseCaseImpl;
  //final bool online;
  //final StateController<bool> onlineController;

  // Textfields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  TextEditingController getEmailController() {
    return emailController;
  }

  TextEditingController getPasswordController() {
    return passwordController;
  }

  Future<ResponseModel> login() async {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegExp.hasMatch(emailController.text)) {
      state = state.copyWith(errorEmail: "El email debe ser valido");
    } else {
      state = state.copyWith(errorEmail: "");
    }

    var resp = await loginUseCaseImpl.login(
        loginModel: LoginModel(
      email: emailController.text,
      password: passwordController.text,
    ));

    if (resp.response != null) {
      LoginResponseModel user = resp.response!;
      state = state.copyWith(
        idusuario: user.idusuario,
        nombre: user.nombre,
        cedula: user.cedula,
        correo: user.email,
        telefono: user.telefono,
        rol: user.rol,
        ingreso: user.ingreso,
        idEmpresa: user.idEmpresa,
      );
    } else {}

    return resp;
  }

  void passwordErrorAdd() {
    state = state.copyWith(errorPassword: "Contraseña o correo incorrecta");
  }
}

final loginController = StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(
    LoginUseCaseImpl(LoginService()),
    //ref.watch(onlineProvider),
    //ref.read(onlineProvider.notifier),
  ),
);
