import 'dart:ui';

import 'package:flutter/material.dart';

import '../../domain/models/cuidados_model.dart';

class CareWidget extends StatelessWidget {
  final Cuidados cuidado;
  final VoidCallback onEdit; // Agrega este parámetro
  final VoidCallback onDelete; // Agrega este parámetro
  CareWidget(
      {required this.cuidado, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5, // Elevación de la tarjeta
        margin: EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 1.0), // Margen de la tarjeta
        shape: RoundedRectangleBorder(
          // Agrega el radio de borde
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nombre: ',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 2.0), // Agrega padding arriba
                          child: Text(
                            cuidado.name ?? '',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ]),

                  SizedBox(
                      height: 8.0), // Espacio entre el nombre y la descripción
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Descripción: ',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 2.0), // Agrega padding arriba
                          child: Text(
                            cuidado.description ?? '',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ]),
                  SizedBox(
                      height: 8.0), // Espacio entre el nombre y la descripción
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tipo del cuidado: ',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 2.0), // Agrega padding arriba
                          child: Text(
                            cuidado.type ?? '',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ]),

                  SizedBox(
                      height: 8.0), // Espacio entre el nombre y la descripción
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fecha de inicio: ',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 2.0), // Agrega padding arriba
                          child: Text(
                            '${cuidado.initialDate!.year}-${cuidado.initialDate!.month}-${cuidado.initialDate!.day}',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ]),

                  SizedBox(height: 8.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fecha de fin: ',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 2.0), // Agrega padding arriba
                          child: Text(
                            '${cuidado.finalDate!.year}-${cuidado.finalDate!.month}-${cuidado.finalDate!.day}',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ]),
                  SizedBox(height: 8.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Insumo: ',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 2.0), // Agrega padding arriba
                          child: Text(
                            cuidado.insumo ?? '',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 16,
                  ),
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
                ])));
  }
}
