import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/features/1.login/presentation/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.connectionError});

  final String connectionError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/error_animation.json',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'Perdiste la conexión a internet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Intentalo mas tarde',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                context.remplaceRoute(const LoginPage());
              },
              child: const Text('Volver a login'),
            ),
          ],
        ),
      ),
    );
  }
}
