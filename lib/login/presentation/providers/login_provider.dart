import 'package:agrotech/home/presentation/home_page.dart';
import 'package:agrotech/login/data/network/login_service.dart';
import 'package:agrotech/login/domain/use_cases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) => LoginUseCase(loginService: LoginService()));
final correoProvider = StateProvider<TextEditingController>((ref) => TextEditingController());
final contrasenaProvider = StateProvider<TextEditingController>((ref) => TextEditingController());
final isLoggedProvider = StateProvider<bool>((ref) => false);

Future<UserRol> loginOk(TextEditingController emailcontroller, TextEditingController passwordController) async {
  final ref = ProviderContainer();
  final servicioAutenticacion = ref.listen(loginUseCaseProvider, (previous, next) {});

  UserRol response =
      await servicioAutenticacion.read().login(correo: emailcontroller.value.text, contrasena: passwordController.text);

  return response;
}
