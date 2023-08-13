import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../domain/models/plagas_model.dart';

class PestWidget extends StatelessWidget {
  final Plaga plaga;
 final VoidCallback onEdit; // Agrega este parámetro
 final VoidCallback onDelete; // Agrega este parámetro
 const PestWidget({required this.plaga,required this.onEdit,required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Elevación de la tarjeta
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 1.0), // Margen de la tarjeta
      shape: RoundedRectangleBorder( // Agrega el radio de borde
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
                    Text(
                    'Nombre: ',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Padding(
                  padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                  child: Text(
                    plaga.name ?? '',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  ),
                ]
              ),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
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
                  padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                  child: Text(
                    plaga.description ?? '',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  ),
                ]
              ),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                    Text(
                    'Estado de la plaga: ',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Padding(
                  padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                  child: Text(
                    plaga.state ?? '',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  ),
                ]
              ),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                    Text(
                    'Observaciones: ',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Padding(
                  padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                  child: Text(
                    plaga.observation ?? '',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  ),
                ]
              ),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                    Text(
                    'Fecha de aparición: ',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Padding(
                  padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                  child: Text(
                    plaga.appareceDate ?? '',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  ),
                ]
              ),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                    Text(
                    'Tratamiento: ',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Padding(
                  padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                  child: Text(
                    plaga.state_tratment ?? 'No se ha iniciado ningun tratamiento.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  ),
                ]
              ),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                    Text(
                    'Familia de la plaga: ',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Padding(
                  padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                  child: Text(
                    plaga.pestFamily ?? '',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  ),
                ]
              ),
             SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  onPressed:onEdit,
                   backgroundColor: Colors.green, 
                  child: Icon(Icons.edit),
                ),
                SizedBox(width: 8.0),
                FloatingActionButton(
                  onPressed:onDelete,
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