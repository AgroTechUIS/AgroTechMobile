import 'dart:convert';

class PlagaModel {
  String? nombre;
  String? descripcion;
  String? sintoma;
  String? tratamiento;

  PlagaModel({
    this.nombre,
    this.descripcion,
    this.sintoma,
    this.tratamiento,
  });

  PlagaModel.fromJson(Map<String, dynamic> json) {
    nombre = json["nombre"];
    descripcion = json["descripcion"];
    sintoma = json["sintoma"];
    tratamiento = json["tratamiento"];
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nombre"] = nombre;
    data["descripcion"] = descripcion;
    data["sintoma"] = sintoma;
    data["tratamiento"] = tratamiento;
    return jsonEncode(data);
  }
}
