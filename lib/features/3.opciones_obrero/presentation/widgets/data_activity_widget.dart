import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';
import 'package:flutter/material.dart';

class DataActivity extends StatelessWidget {
  const DataActivity({
    super.key,
    required this.actividad,
  });

  final ActivityModel actividad;

  @override
  Widget build(BuildContext context) {
    const spacerTable = TableRow(
      children: [SizedBox(height: 5), SizedBox(height: 5)],
    );
    return Table(
      children: [
        TableRow(
          children: [
            const Text('Actividad:'),
            Text(actividad.nombre ?? ''),
          ],
        ),
        spacerTable,
        TableRow(
          children: [
            const Text('Id:'),
            Text('${actividad.id ?? ''}'),
          ],
        ),
        spacerTable,
        TableRow(
          children: [
            const Text('Finca:'),
            Text(actividad.finca ?? ''),
          ],
        ),
        spacerTable,
        TableRow(
          children: [
            const Text('Zona:'),
            Text(actividad.zona ?? ''),
          ],
        ),
        spacerTable,
        TableRow(
          children: [
            const Text('Fecha:'),
            Text(actividad.fecha ?? ''),
          ],
        ),
        spacerTable,
      ],
    );
  }
}
