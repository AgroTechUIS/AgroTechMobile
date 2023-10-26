import 'package:agrotech/common_utilities/widgets/agrotech_button_widget.dart';
import 'package:agrotech/features/2.home/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class LoginOfflineView extends ConsumerWidget {
  const LoginOfflineView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        Lottie.asset(
                          'assets/error_animation.json',
                          width: 150,
                          height: 150,
                        ),
                        const Text(
                          "¡Atención! parece que no cuentas con internet",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        AgrotechButton(
                          text: "Reintentar",
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(height: 10),
                        AgrotechButton(
                          text: "Ingresar Offline",
                          onPressed: () {},
                        ),
                        //_OffLineAccessWidget(),
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

  void goOffline(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage(rol: UserRol.obrero)),
    );
  }
}

class _OffLineAccessWidget extends StatelessWidget {
  const _OffLineAccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "Puedes seguir navegando en la aplicacion de forma offline, elije tu rol:",
          //textAlign: TextAlign.center,
        ),
        AgrotechButton(
          text: "Ingresar como obrero",
          onPressed: () {},
        ),
        AgrotechButton(
          text: "Ingresar como supervisor",
          onPressed: () {},
        ),
      ],
    );
  }
}
