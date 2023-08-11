import 'package:agrotech/in_admin/presentation/in_admin_page.dart';
import 'package:agrotech/login/presentation/login_page.dart';
import 'package:agrotech/plagas/presentation/plagas_page.dart';
import 'package:agrotech/signup/presentation/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgroTech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginPage(),
        'signup': (_) => const SignUpPage(),
        'inadmin': (_) => InAdminPage(),
        'plagas': (_) => PlagasPage()
        //'miapp': (_) => const MyPage(),
      },
    );
  }
}
