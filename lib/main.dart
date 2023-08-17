import 'package:agrotech/in_admin/presentation/in_admin_page.dart';
import 'package:agrotech/login/presentation/login_page.dart';
import 'package:agrotech/plagas/presentation/plagas_page.dart';
import 'package:agrotech/signup/presentation/signup_page.dart';
import 'package:agrotech/tratamientos/presentation/tratamientos_page.dart';
import 'package:agrotech/variables/presentation/variablesT_page.dart';
import 'package:agrotech/variables/presentation/variables_page.dart';
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
        primarySwatch: Colors.green,
      ),
      initialRoute: 'login',
      routes: {
        'login': (_) => const VariablesTPage(),
        'signup': (_) => const SignUpPage(),
        'inadmin': (_) => InAdminPage(),
        'plagas': (_) => PlagasPage(),
        'tratamientos': (_) => TratamientosPage(),
        'variables': (_) => VariablesTPage()
        //'miapp': (_) => const MyPage(),
      },
    );
  }
}
