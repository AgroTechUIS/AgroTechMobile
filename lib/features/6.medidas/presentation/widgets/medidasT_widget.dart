import 'dart:typed_data';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/models/measure_model.dart';

class VariablesTWidget extends StatelessWidget {
  final MeasureModel medida;
  final VoidCallback onEdit; // Agrega este parámetro
  final VoidCallback onDelete; // Agrega este parámetro
  VariablesTWidget(
      {required this.medida, required this.onEdit, required this.onDelete});

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
