// coverage:ignore-file
// ignore: must_be_immutable
import 'package:agrotech/features/4.products/presentation/product_controller.dart';
import 'package:agrotech/features/5.plagas/presentation/pest_page.dart';
import 'package:agrotech/features/4.products/domain/models/product_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductWidget extends StatelessWidget {
  final ProductResponseModel producto;
  final VoidCallback onEdit; // Agrega este parámetro
  final VoidCallback onDelete; // Agrega este parámetro
  ProductWidget({required this.producto, required this.onEdit, required this.onDelete});

  String? estado;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Elevación de la tarjeta
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 1.0), // Margen de la tarjeta
      shape: RoundedRectangleBorder(
        // Agrega el radio de borde
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Nombre: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  producto.title ?? '',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),

            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Resumen: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  producto.summary ?? '',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),
            SizedBox(height: 8.0),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Precio: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  '${producto.price}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Stock: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  producto.stock.toString(),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Estado: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  getEstadoText(producto.state),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),

            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: onEdit,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.edit),
                ),
                SizedBox(width: 8.0),
                FloatingActionButton(
                  onPressed: onDelete,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String getEstadoText(int? estado) {
  switch (estado) {
    case 1:
      return 'Activo';
    case 2:
      return 'Desactivado';
    default:
      return 'Desconocido';
  }
}
