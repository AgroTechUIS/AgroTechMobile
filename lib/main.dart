import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/features/1.login/presentation/login_page.dart';
import 'package:agrotech/features/5.plagas/presentation/pest_page.dart';
import 'package:agrotech/features/5.products/presentation/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/4.cultivos/presentation/crop_page.dart';

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
          'login': (_) => LoginPage(),
          'plagas': (_) => PlagasPage(),
          'crops': (_) => CropPage(),
          'products': (_) => ProductPage(),
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es', 'ES'),
        ],
        theme: ThemeData.light().copyWith(
          primarySwatch: Colors.blue,
          colorScheme: const ColorScheme.light(
            primary: Color.fromRGBO(128, 191, 33, 1),
            onPrimary: Colors.white,
            surface: Colors.grey,
            onSurface: Colors.black,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(colors.green3),
            ),
          ),
          appBarTheme: AppBarTheme(color: colors.green3),
        ));
  }
}
