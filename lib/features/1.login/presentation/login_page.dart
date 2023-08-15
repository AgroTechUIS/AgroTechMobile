import 'package:agrotech/common_utilities/config/theme_provider.dart';
import 'package:agrotech/features/2.home/presentation/home_page.dart';
import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrotech/common_utilities/config/colors_theme.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginControllerIns = ref.read(loginController.notifier);
    final bool isDarkmode = ref.watch(isDarkmodeProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://i.ibb.co/mJ6Td3C/retrato-trabajador-agricola-sosteniendo-saco-lleno-manzanas.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
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
                        ElevatedButton(
                          onPressed: () async {
                            var isLoggedIn = await loginControllerIns.login();
                            if (isLoggedIn.error == null) {
                              goToHome(context, isLoggedIn.rol!);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              colors.appbar,
                            ),
                          ),
                          child: const Text(
                            "Iniciar Sesión",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
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
      floatingActionButton: InkWell(
          onTap: () => ref.watch(isDarkmodeProvider.notifier).update((state) => !state),
          child: Container(
              margin: const EdgeInsets.all(10),
              color: Colors.white,
              child: Icon(isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined))),
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
      default:
        rolType = UserRol.lock;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage(rol: rolType)),
    );
  }
}
