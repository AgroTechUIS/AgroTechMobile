import 'dart:convert';

class EmpresaModel {
  String? nombre;
  String? direccion;
  String? telefono;

  EmpresaModel({
    this.nombre,
    this.direccion,
    this.telefono,
  });

  EmpresaModel.fromJson(Map<String, dynamic> json) {
    nombre = json["nombre"];
    direccion = json["direccion"];
    telefono = json["telefono"];
  }
  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nombre"] = nombre;
    data["direccion"] = direccion;
    data["telefono"] = telefono;
    return jsonEncode(data);
  }
}
