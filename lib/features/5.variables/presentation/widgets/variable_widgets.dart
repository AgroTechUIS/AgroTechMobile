import 'package:flutter/material.dart';

import '../../domain/models/variable_model.dart';

class VariablesWidget extends StatelessWidget {
  final VariableModel variable;
  final VoidCallback onEdit; // Agrega este parámetro
  final VoidCallback onDelete; // Agrega este parámetro
  VariablesWidget(
      {required this.variable, required this.onEdit, required this.onDelete});

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
                  variable.name ?? '',
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
                'Descripción: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  variable.description ?? '',
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
                'Metodo de la variable: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  variable.method ?? '',
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
                'Fecha de toma: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  '${variable.date!.year}-${variable.date!.month}-${variable.date!.day}',
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
                'Instrumento: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  variable.instrumento ?? '',
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
