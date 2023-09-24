import 'dart:convert';

List<CropModel> cropFromJson(String str) =>
    List<CropModel>.from(json.decode(str).map((x) => CropModel.fromJson(x)));

String cropToJson(List<CropModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<CropModel> listplagaFromJson(List<dynamic> datos) =>
    datos.map((e) => CropModel.fromJson(e)).toList();

class CropModel {
  final int? id;
  final String? name;
  final String? description;
  final DateTime? plantingDate;
  final int? plantPlanted;
  final String? variety;
  CropModel(
      {this.id,
      this.name,
      this.description,
      this.plantingDate,
      this.plantPlanted,
      this.variety});

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "plantingDate":
            "${plantingDate?.year.toString().padLeft(4, '0')}-${plantingDate?.month.toString().padLeft(2, '0')}-${plantingDate?.day.toString().padLeft(2, '0')}",
        "plantPlanted": plantPlanted,
        "variety": variety
      };
  factory CropModel.fromJson(Map<String, dynamic> json) => CropModel(
      id: json["id"],
      name: json["name"],
      plantingDate: json["plantingDate"],
      plantPlanted: json["plantPlanted"],
      variety: json["variety"]);
}

  /*
  factory PlagaModel.fromJson(Map<String, dynamic> json) => PlagaModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        state: json["state"],
        observation: json["observation"],
        appareceDate: DateTime.parse(json["appareceDate"]),
        pestFamily: json["pestFamily"],
        stateTratment: json["state_tratment"],
        adjuntoDto: json["adjuntoDto"] == null
            ? null
            : AdjuntoDto.fromJson(json["adjuntoDto"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "state": state,
        "observation": observation,
        "appareceDate":
            "${appareceDate?.year.toString().padLeft(4, '0')}-${appareceDate?.month.toString().padLeft(2, '0')}-${appareceDate?.day.toString().padLeft(2, '0')}",
        "pestFamily": pestFamily,
        "state_tratment": stateTratment,
        "adjuntoDto": adjuntoDto?.toJson(),
      };
}

class AdjuntoDto {
  final int id;
  final String url;

  AdjuntoDto({
    required this.id,
    required this.url,
  });

  factory AdjuntoDto.fromJson(Map<String, dynamic> json) => AdjuntoDto(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
      */
