import 'dart:convert';

List<CareResponseModel> careFromJson(String str) =>
    List<CareResponseModel>.from(
        json.decode(str).map((x) => CareResponseModel.fromJson(x)));

String careToJson(List<CareResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<CareResponseModel> listcareFromJson(List<dynamic> datos) =>
    datos.map((e) => CareResponseModel.fromJson(e)).toList();

class CareResponseModel {
  int id;
  String? name;
  String? description;
  String? type;
  DateTime? initialDate;
  DateTime? finalDate;
  String? insumo;

  CareResponseModel(
      {required this.id,
      this.name,
      this.description,
      this.type,
      this.initialDate,
      this.finalDate,
      this.insumo});

  factory CareResponseModel.fromJson(Map<String, dynamic> json) =>
      CareResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        initialDate: json["initialDate"] != null
            ? DateTime.parse(json["initialDate"])
            : null,
        finalDate: json["finalDate"] != null
            ? DateTime.parse(json["finalDate"])
            : null,
        insumo: json["insumo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
        "initialDate": initialDate?.toIso8601String(),
        "finalDate": finalDate?.toIso8601String(),
        "insumo": insumo,
      };
}
