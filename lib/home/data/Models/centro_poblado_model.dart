import 'dart:convert';

class CentroPobladoModel {
  int? id;
  String? nombre;
  double? latitud;
  double? longitud;
  double? altitud;
  String? municipio;
  String? departamente;

  CentroPobladoModel({
    this.id,
    this.nombre,
    this.latitud,
    this.longitud,
    this.altitud,
    this.municipio,
    this.departamente,
  });

  CentroPobladoModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nombre = json["nombre"];
    latitud = json["latitud"];
    longitud = json["longitud"];
    altitud = json["altitud"];
    municipio = json["municipio"];
    departamente = json["departamente"];
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["nombre"] = nombre;
    data["latitud"] = latitud;
    data["longitud"] = longitud;
    data["altitud"] = altitud;
    data["municipio"] = municipio;
    data["departamente"] = departamente;
    return jsonEncode(data);
  }
}
