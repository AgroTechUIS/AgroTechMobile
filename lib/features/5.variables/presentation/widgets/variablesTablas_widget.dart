// coverage:ignore-file
import 'package:flutter/material.dart';

import '../../domain/models/variable_model.dart';

class VariablesTablasWidget extends StatelessWidget {
  final VariableModel variable;
  final VoidCallback onEdit; // Agrega este parámetro
  final VoidCallback onDelete; // Agrega este parámetro
  VariablesTablasWidget({required this.variable, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return // Espacio entre el nombre y la descripción
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      FloatingActionButton(
        mini: true,
        onPressed: onEdit,
        backgroundColor: Colors.green,
        child: Icon(Icons.edit),
      ),
      SizedBox(width: 8.0),
      FloatingActionButton(
        mini: true,
        onPressed: onDelete,
        backgroundColor: Colors.red,
        child: Icon(Icons.delete),
      )
    ]);
  }
}
