import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/features/1.login/presentation/login_page.dart';
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
        initialRoute: 'login',
        routes: {
          'login': (_) => const LoginPage(),
        },
        theme: ThemeData.light().copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(colors.green3),
            ),
          ),
          appBarTheme: AppBarTheme(color: colors.green3),
        ));
  }
}
