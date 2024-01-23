// coverage:ignore-file
import 'dart:convert';

List<MeasureResponseModel> measureFromJson(String str) =>
    List<MeasureResponseModel>.from(json.decode(str).map((x) => MeasureResponseModel.fromJson(x)));

String measureToJson(List<MeasureResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<MeasureResponseModel> listmeasureFromJson(List<dynamic> datos) =>
    datos.map((e) => MeasureResponseModel.fromJson(e)).toList();

class MeasureResponseModel {
  int id;
  int? measurement_value;
  String? measuring_unit;
  String? description;
  DateTime? date;
  int? variable;
  MeasureResponseModel(
      {required this.id, this.measurement_value, this.measuring_unit, this.description, this.date, this.variable});

  factory MeasureResponseModel.fromJson(Map<String, dynamic> json) => MeasureResponseModel(
        id: json["id"],
        measurement_value: json["measurement_Value"],
        measuring_unit: json["measuring_Unit"],
        description: json["description"],
        date: json["date"] != null ? DateTime.parse(json["date"]) : null,
        variable: json["variable"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "measurement_Value": measurement_value,
        "measuring_Unit": measuring_unit,
        "description": description,
        "date": date?.toIso8601String(),
        "variable": variable,
      };
  Map<String, dynamic> toJsonPost() => {
        "measurement_Value": measurement_value,
        "measuring_Unit": measuring_unit,
        "description": description,
        "date": date?.toIso8601String(),
        "variable": variable,
      };
}
