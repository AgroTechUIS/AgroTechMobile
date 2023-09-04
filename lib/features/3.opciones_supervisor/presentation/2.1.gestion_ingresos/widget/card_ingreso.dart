import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:flutter/material.dart';

class CardIngresoWidget extends StatelessWidget {
  const CardIngresoWidget({
    super.key,
    required this.numeroFactura,
    required this.valor,
  });

  final String numeroFactura;
  final double valor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
      child: Card(
        child: Row(
          children: [
            const SizedBox(width: 16.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Venta',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: colors.green),
                    ),
                    Text(
                      'N° factura: $numeroFactura',
                      style: TextStyle(
                        fontSize: 16.0,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Valor: \$ $valor',
                      style: TextStyle(
                        fontSize: 16.0,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
