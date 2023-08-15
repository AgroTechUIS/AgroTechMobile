import 'package:agrotech/features/1.login/presentation/login_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/actividad_cultivo_page/actividad_cultivo_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/asignacion_cultivos/asignacion_cultivos_page.dart';
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
        'login': (_) => AsigCultivoPage(),
        //'miapp': (_) => const MyPage(),
      },
    );
  }
}
