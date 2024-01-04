import 'package:agrotech/features/1.login/presentation/login_page.dart';
import 'package:agrotech/features/5.plagas/presentation/pest_page.dart';
import 'package:agrotech/features/5.products/presentation/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'products',
      routes: {
        'login': (_) => LoginPage(),
        'plagas': (_) => PlagasPage(),
        'crops': (_) => CropPage(),
        'products': (_) => ProductPage()
      },
    );
  }
}
