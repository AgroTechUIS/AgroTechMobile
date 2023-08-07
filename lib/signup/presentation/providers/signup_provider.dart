import 'package:agrotech/home/presentation/home_page.dart';
import 'package:agrotech/signup/data/network/signup_service.dart';
import 'package:agrotech/signup/domain/use_cases/signup_use_case.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';

final signUpUseCaseProvider = Provider<SignUpUseCase>(
    (ref) => SignUpUseCase(signupService: SignUpService()));
final namesProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final surnamesProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final correoProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final contrasenaProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final confirmContrasenaProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final phoneProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final isLoggedProvider = StateProvider<bool>((ref) => false);
