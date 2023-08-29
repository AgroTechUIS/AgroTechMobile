import 'package:agrotech/common_utilities/controllers/connection_controller.dart';
import 'package:agrotech/common_utilities/widgets/agrotech_button_widget.dart';
import 'package:agrotech/features/2.home/presentation/home_page.dart';
import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*final randomNumberProvider = StreamProvider<int>((ref) {
  final random = Random();
  return Stream.periodic(const Duration(seconds: 30), (index) {
    return random.nextInt(100);
  });
});*/

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginControllerIns = ref.read(loginController.notifier);
    final loginState = ref.watch(loginController);
    final connectivityResult = ref.watch(connectivityProvider);

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
                        connectivityResult.when(
                          data: (value) {
                            if (value == ConnectivityResult.none) {
                              return Column(
                                children: [
                                  const SizedBox(height: 10),
                                  const Text("Atencion no hay internet"),
                                  AgrotechButton(
                                    text: "Ingresar Offline",
                                    onPressed: () async {
                                      goToHome(context, 'obrero');
                                    },
                                  ),
                                ],
                              );
                            } else {
                              return Column(
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
                                              style: TextStyle(color: Colors.orange, fontSize: 18),
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
                                  const SizedBox(height: 20),
                                  AgrotechButton(
                                    text: "Iniciar Sesión",
                                    onPressed: () async {
                                      var isLoggedIn = await loginControllerIns.login();
                                      if (isLoggedIn.error == null) {
                                        goToHome(context, isLoggedIn.rol!);
                                      } else {}
                                    },
                                  ),
                                ],
                              );
                            }
                          },
                          loading: () => Column(
                            children: [
                              const SizedBox(height: 10),
                              const Text("Atencion no hay internet"),
                              AgrotechButton(
                                text: "Ingresar Offline",
                                onPressed: () async {
                                  goToHome(context, 'obrero');
                                },
                              ),
                            ],
                          ),
                          error: (error, stack) => Text('Error: $error'),
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

  void goToHome(BuildContext context, String rol) {
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage(rol: rolType)),
    );
  }
}
