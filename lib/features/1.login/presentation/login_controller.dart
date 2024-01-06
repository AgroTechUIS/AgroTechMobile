// ignore_for_file: depend_on_referenced_packages

import 'package:agrotech/common_utilities/models/response_model.dart';
import 'package:agrotech/features/1.login/data/data_sources/login_data_source.dart';
import 'package:agrotech/features/1.login/domain/models/login_model.dart';
import 'package:agrotech/features/1.login/domain/models/login_response_model.dart';
import 'package:agrotech/features/1.login/domain/use_cases/login_use_case.dart';
import 'package:agrotech/features/1.login/presentation/login_state.dart';
import 'package:agrotech/features/3.opciones_obrero/data/network/activities_data_source.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/update_activity_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/use_cases/activities_use_case.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(
    this.loginUseCaseImpl,
    this.activitiesUseCaseImpl,
  ) : super(LoginState());

  // Use cases
  final LoginUseCaseImpl loginUseCaseImpl;
  final ActivitiesUseCaseImpl activitiesUseCaseImpl;

  // Textfields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<ResponseModel> login() async {
    validateEmail();
    var resp = await loginUseCaseImpl.login(
      loginModel: LoginModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (resp.response != null) {
      sendOfflineData();
      saveUserData(resp.response!);
    }
    return resp;
  }

  void validateEmail() {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegExp.hasMatch(emailController.text)) {
      state = state.copyWith(errorEmail: "El email debe ser valido");
    } else {
      state = state.copyWith(errorEmail: "");
    }
  }

  void saveUserData(LoginResponseModel user) {
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
  }

  void passwordErrorAdd() {
    state = state.copyWith(errorPassword: "Contraseña o correo incorrecta");
  }

  void sendOfflineData() async {
    var pref = await SecureSharedPref.getInstance();
    Map<String, dynamic> savedActivities = await pref.getMap("SavedActivities") as Map<String, dynamic>;
    if (savedActivities != null) {
      await activitiesUseCaseImpl.updateActivities(updateActivityModel: UpdateActivityModel.fromJson(savedActivities));
    }
  }
}

final loginController = StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(
    LoginUseCaseImpl(LoginService()),
    ActivitiesUseCaseImpl(ActivitiesDataSource()),
  ),
);
