import 'package:agrotech/config/theme_provider.dart';
import 'package:agrotech/home/presentation/home_page.dart';
import 'package:agrotech/login/presentation/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrotech/config/colors_theme.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = ref.watch(correoProvider);
    final TextEditingController passwordController = ref.watch(contrasenaProvider);
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
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Correo electrónico",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 3),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: passwordController,
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
                            var isLoggedIn = await loginOk(emailController, passwordController);
                            if (isLoggedIn != UserRol.lock) {
                              goToHome(context, isLoggedIn);
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

  void goToHome(BuildContext context, UserRol rol) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(
                rol: rol,
              )),
    );
  }
}
