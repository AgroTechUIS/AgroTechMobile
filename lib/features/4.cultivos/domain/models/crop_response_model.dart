// coverage:ignore-file
import 'dart:convert';

List<CropResponseModel> cropFromJson(String str) =>
    List<CropResponseModel>.from(json.decode(str).map((x) => CropResponseModel.fromJson(x)));

String cropToJson(List<CropResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<CropResponseModel> listplagaFromJson(List<dynamic> datos) =>
    datos.map((e) => CropResponseModel.fromJson(e)).toList();

class CropResponseModel {
  final int? id;
  final String? name;
  final String? description;
  final int? cantidadSemillas;
  final double? costoSemillas;
  final int? idEmpresa;
  final String? idPlanta;
  final int? planta;
  // final UserEmail? usuario;

  CropResponseModel({
    this.id,
    this.name,
    this.description,
    this.cantidadSemillas,
    this.costoSemillas,
    this.idEmpresa,
    this.idPlanta,
    this.planta,
    //this.usuario
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "cantidad_semillas": cantidadSemillas,
        "costo_semillas": costoSemillas,
        "empresa": idEmpresa,
        "plant": idPlanta,
        "planta": planta,
        // "plantingDate":
        //   "${plantingDate?.year.toString().padLeft(4, '0')}-${plantingDate?.month.toString().padLeft(2, '0')}-${plantingDate?.day.toString().padLeft(2, '0')}",
        //"usuario": usuario?.email
      };
  Map<String, dynamic> toJsonEdit() => {
        "id": id,
        "name": name,
        "description": description,
        "cantidad_semillas": cantidadSemillas,
        "costo_semillas": costoSemillas,
        "empresa": idEmpresa,
        "plant": idPlanta,
        "planta": planta,

        //   "plantingDate":
        //      "${plantingDate?.year.toString().padLeft(4, '0')}-${plantingDate?.month.toString().padLeft(2, '0')}-${plantingDate?.day.toString().padLeft(2, '0')}",
        //"usuario": usuario?.email
      };
  factory CropResponseModel.fromJson(Map<String, dynamic> json) => CropResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        cantidadSemillas: json["cantidad_semillas"],
        costoSemillas: json["costo_semillas"],
        //idEmpresa: json["empresa"]
        // plantingDate: DateTime.parse(json["plantingDate"]),
        // plantPlanted: int.parse(json["plantPlanted"]), // Convierte a cadena (string)
        // variety: json["variety"],
        /* usuario: json["usuario"] == null
              ? null
              : UserEmail.fromJson({
                  "id": json["usuario"]["id"],
                  "email": json["usuario"]["email"],
                })*/
      );
}

class UserEmail {
  final int? id;
  final String? email;

  UserEmail({
    this.id,
    this.email,
  });

  factory UserEmail.fromJson(Map<String, dynamic> json) => UserEmail(
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
      };
}
