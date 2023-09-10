import 'package:flutter/material.dart';

class ChangeStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambiar Estado de Tabla'),
      ),
      body: ListView(
        children: [
          ItemWidget(name: 'Tarea 1', isCompleted: false),
          ItemWidget(name: 'Tarea 2', isCompleted: true),
          // Agrega más elementos aquí
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String name;
  final bool isCompleted;

  ItemWidget({required this.name, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(isCompleted ? 'Completado' : 'Pendiente'),
    );
  }
}
