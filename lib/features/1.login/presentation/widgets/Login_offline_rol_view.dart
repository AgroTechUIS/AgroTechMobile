import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/common_utilities/controllers/offline_controller.dart';
import 'package:agrotech/common_utilities/widgets/agrotech_button_widget.dart';
import 'package:agrotech/features/2.home/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class LoginOfflineRolView extends ConsumerWidget {
  const LoginOfflineRolView({super.key});

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
                    width: context.rp(340),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          'assets/error_animation.json',
                          width: 140,
                          height: 140,
                        ),
                        const Text(
                          "Elije el rol de tu cuenta:",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        AgrotechButton(
                          text: "Supervisor",
                          onPressed: () => goOffline(context, ref, UserRol.supervisor),
                        ),
                        const SizedBox(height: 10),
                        AgrotechButton(
                          text: "Gestor",
                          onPressed: () => goOffline(context, ref, UserRol.supervisor),
                        ),
                        const SizedBox(height: 10),
                        AgrotechButton(
                          text: "Obrero",
                          onPressed: () => goOffline(context, ref, UserRol.obrero),
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

  void goOffline(BuildContext context, WidgetRef ref, UserRol rol) {
    ref.read(onlineProvider.notifier).update((state) => false);
    context.pushRoute(HomePage(rol: rol));
  }
}
