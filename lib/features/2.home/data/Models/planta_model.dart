import 'dart:convert';

import 'package:agrotech/features/2.home/data/Models/mantenimiento_model.dart';
import 'package:agrotech/features/2.home/data/Models/plaga_model.dart';

class PlantaModel {
  int? id;
  String? nombre;
  String? descripcion;
  String? planEmergaencia;
  String? requerimientosSuelo;
  int? riegos;
  int? idTipoPlanta;
  List<MantenimientoModel>? mantenimientos;
  List<PlagaModel>? plagas;

  PlantaModel({
    this.id,
    this.nombre,
    this.descripcion,
    this.planEmergaencia,
    this.requerimientosSuelo,
    this.riegos,
    this.idTipoPlanta,
    this.mantenimientos,
    this.plagas,
  });

  // Convertir el Json a Objeto
  PlantaModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nombre = json["nombre"];
    descripcion = json["descripcion"];
    planEmergaencia = json["planEmergaencia"];
    requerimientosSuelo = json["requerimientosSuelo"];
    riegos = json["riegos"];
    idTipoPlanta = json["idTipoPlanta"];
    mantenimientos = json["mantenimientos"];
    plagas = json["plagas"];
  }

  // Convertir el Objeto a Json
  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["nombre"] = nombre;
    data["descripcion"] = descripcion;
    data["planEmergaencia"] = planEmergaencia;
    data["requerimientosSuelo"] = requerimientosSuelo;
    data["riegos"] = riegos;
    data["idTipoPlanta"] = idTipoPlanta;
    data["mantenimientos"] = mantenimientos;
    data["plagas"] = plagas;
    return jsonEncode(data);
  }
}
