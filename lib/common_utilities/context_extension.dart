import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// Ajusta las dimenciones en funcion del ancho de la pantalla
  double rp(double pixel) {
    return pixel / 360 * MediaQuery.of(this).size.width;
  }

  void pushRoute(Widget page) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void remplaceRoute(Widget page) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
