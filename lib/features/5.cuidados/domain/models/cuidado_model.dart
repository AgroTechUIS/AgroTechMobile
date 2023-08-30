import 'dart:convert';

List<CareModel> careFromJson(String str) =>
    List<CareModel>.from(json.decode(str).map((x) => CareModel.fromJson(x)));

String careToJson(List<CareModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<CareModel> listcareFromJson(List<dynamic> datos) =>
    datos.map((e) => CareModel.fromJson(e)).toList();

class CareModel {
  int id;
  String? name;
  String? description;
  String? type;
  DateTime? initialDate;
  DateTime? finalDate;
  String? insumo;

  CareModel(
      {required this.id,
      this.name,
      this.description,
      this.type,
      this.initialDate,
      this.finalDate,
      this.insumo});
  factory CareModel.fromJson(Map<String, dynamic> json) => CareModel(
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
