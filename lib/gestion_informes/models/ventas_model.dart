import 'dart:convert';

import 'package:agrotech/gestion_informes/models/cosecha_model.dart';

class VentasModel {
  int? id;
  int? unidades;
  double? precio;
  HarvesModel? cosecha;

  VentasModel({
    this.id,
    this.unidades,
    this.precio,
    this.cosecha,
  });

  VentasModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    unidades = json["unidades"];
    precio = json["precio"];
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["unidades"] = unidades;
    data["precio"] = precio;
    return jsonEncode(data);
  }
}
