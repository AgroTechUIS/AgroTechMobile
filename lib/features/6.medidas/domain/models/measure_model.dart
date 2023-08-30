import 'dart:convert';
import 'dart:typed_data';

List<MeasureModel> measureFromJson(String str) => List<MeasureModel>.from(
    json.decode(str).map((x) => MeasureModel.fromJson(x)));

String measureToJson(List<MeasureModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<MeasureModel> listmeasureFromJson(List<dynamic> datos) =>
    datos.map((e) => MeasureModel.fromJson(e)).toList();

class MeasureModel {
  int id = 0;
  int? value;
  String? description;
  DateTime? date;
  String? unit;
  MeasureModel(
      {required this.id, this.value, this.description, this.date, this.unit});

  factory MeasureModel.fromJson(Map<String, dynamic> json) => MeasureModel(
        id: json["id"],
        value: json["value"],
        description: json["description"],
        date: json["date"] != null ? DateTime.parse(json["date"]) : null,
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "description": description,
        "date": date?.toIso8601String(),
        "unit": unit,
      };
}
