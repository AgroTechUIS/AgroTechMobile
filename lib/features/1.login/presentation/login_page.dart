// ignore_for_file: use_build_context_synchronously

import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/common_utilities/controllers/offline_controller.dart';
import 'package:agrotech/common_utilities/widgets/agrotech_button_widget.dart';
import 'package:agrotech/features/1.login/presentation/widgets/Login_offline_view.dart';
import 'package:agrotech/features/2.home/presentation/home_page.dart';
import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginControllerIns = ref.read(loginController.notifier);
    final loginState = ref.watch(loginController);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login-bakground.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.white.withOpacity(0.4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                        ),
                        Column(
                          children: [
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: loginControllerIns.emailController,
                              decoration: const InputDecoration(
                                hintText: "Correo electrónico",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green, width: 3),
                                ),
                              ),
                            ),
                            loginState.errorEmail.isNotEmpty
                                ? Row(
                                    children: [
                                      Text(
                                        loginState.errorEmail,
                                        style: const TextStyle(color: Colors.red, fontSize: 14),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            const SizedBox(height: 20),
                            TextField(
                              controller: loginControllerIns.passwordController,
                              decoration: const InputDecoration(
                                hintText: "Contraseña",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green, width: 3),
                                ),
                              ),
                              obscureText: true,
                            ),
                            loginState.errorPassword.isNotEmpty
                                ? Row(
                                    children: [
                                      Text(
                                        loginState.errorPassword,
                                        style: const TextStyle(color: Colors.red, fontSize: 14),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            const SizedBox(height: 20),
                            AgrotechButton(
                              text: "Iniciar Sesión",
                              onPressed: () => _tap(context, ref),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _tap(BuildContext context, WidgetRef ref) async {
    final offLineContr = ref.read(onlineProvider.notifier);
    final loginControllerIns = ref.read(loginController.notifier);
    var isLoggedIn = await loginControllerIns.login();
    if (isLoggedIn.error == null) {
      offLineContr.update((state) => true);
      goToHome(context, isLoggedIn.response.rol!);
    } else if (isLoggedIn.error == 'Latencia' || isLoggedIn.error == 'Sin internet') {
      context.pushRoute(const LoginOfflineView());
    } else {
      loginControllerIns.passwordErrorAdd();
    }
  }

  goToHome(BuildContext context, String rol) {
    UserRol rolType;
    switch (rol) {
      case 'supervisor':
        rolType = UserRol.supervisor;
        break;
      case 'obrero':
        rolType = UserRol.obrero;
        break;
      case 'gestion_agricola':
        rolType = UserRol.gestor;
        break;
      default:
        rolType = UserRol.lock;
    }
    context.remplaceRoute(HomePage(rol: rolType));
  }
}
