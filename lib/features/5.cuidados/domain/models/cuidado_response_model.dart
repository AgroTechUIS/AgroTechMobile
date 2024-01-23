// ignore_for_file: non_constant_identifier_names

// coverage:ignore-file
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
  String? action_performed;
  String? care_type;
  DateTime? date_init;
  DateTime? date_finish;
  int? crop;

  CareResponseModel(
      {required this.id,
      this.name,
      this.action_performed,
      this.care_type,
      this.date_init,
      this.date_finish,
      this.crop});

  factory CareResponseModel.fromJson(Map<String, dynamic> json) =>
      CareResponseModel(
        id: json["id"],
        name: json["name"],
        action_performed: json["action_performed"],
        care_type: json["care_type"],
        date_init: json["date_init"] != null
            ? DateTime.parse(json["date_init"])
            : null,
        date_finish: json["date_finish"] != null
            ? DateTime.parse(json["date_finish"])
            : null,
        crop: json["crop"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "action_performed": action_performed,
        "care_type": care_type,
        "date_init": date_init?.toIso8601String(),
        "date_finish": date_finish?.toIso8601String(),
        "crop": crop.toString(),
      };

  Map<String, dynamic> toJsonEdit() => {
        "id": id,
        "name": name,
        "action_performed": action_performed,
        "care_type": care_type,
        "date_init": date_init?.toIso8601String(),
        "date_finish": date_finish?.toIso8601String(),
      };
}
