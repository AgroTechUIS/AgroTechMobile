import 'dart:convert';

import 'package:agrotech/home/data/Models/centro_poblado_model.dart';
import 'package:agrotech/home/data/Models/empresa_model.dart';
import 'package:agrotech/home/data/Models/zona_parcela_model.dart';

class ParcelaModel {
  String? nombre;
  CentroPobladoModel? centroPoblado;
  String? descripcion;
  EmpresaModel? empresa;
  List<ZonaParcela>? zonasParcela;

  ParcelaModel({
    this.nombre,
    this.centroPoblado,
    this.descripcion,
    this.empresa,
    this.zonasParcela,
  });

  ParcelaModel.fromJson(Map<String, dynamic> json) {
    nombre = json["nombre"];
    centroPoblado = json["centroPoblado"];
    descripcion = json["descripcion"];
    empresa = json["empresa"];
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nombre"] = nombre;
    data["centroPoblado"] = centroPoblado;
    data["descripcion"] = descripcion;
    data["empresa"] = empresa;
    return jsonEncode(data);
  }
}
