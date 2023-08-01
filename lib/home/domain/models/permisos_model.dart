import 'dart:convert';

class PermisosModel {
  String? nombre;
  String? tabla;
  String? campo;
  String? descripcion;

  PermisosModel({this.nombre, this.tabla, this.campo, this.descripcion});

  PermisosModel.fromJson(Map<String, dynamic> json) {
    nombre = json["nombre"];
    tabla = json["tabla"];
    campo = json["campo"];
    descripcion = json["descripcion"];
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nombre"] = nombre;
    data["tabla"] = tabla;
    data["campo"] = campo;
    data["descripcion"] = descripcion;
    return jsonEncode(data);
  }
}
