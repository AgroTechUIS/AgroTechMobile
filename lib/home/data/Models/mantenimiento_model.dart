import 'dart:convert';

class MantenimientoModel {
  String? nombre;
  String? descripcion;
  String? tipo;
  int? cantidad;

  MantenimientoModel({
    this.nombre,
    this.descripcion,
    this.tipo,
    this.cantidad,
  });

  MantenimientoModel.fromJson(Map<String, dynamic> json) {
    nombre = json["nombre"];
    descripcion = json["descripcion"];
    tipo = json["tipo"];
    cantidad = json["cantidad"];
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nombre"] = nombre;
    data["descripcion"] = descripcion;
    data["tipo"] = tipo;
    data["cantidad"] = cantidad;
    return jsonEncode(data);
  }
}
