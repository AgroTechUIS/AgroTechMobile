import 'dart:convert';
import 'dart:typed_data';

List<MeasureResponseModel> measureFromJson(String str) =>
    List<MeasureResponseModel>.from(
        json.decode(str).map((x) => MeasureResponseModel.fromJson(x)));

String measureToJson(List<MeasureResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<MeasureResponseModel> listmeasureFromJson(List<dynamic> datos) =>
    datos.map((e) => MeasureResponseModel.fromJson(e)).toList();

class MeasureResponseModel {
  int id = 0;
  int? value;
  String? description;
  DateTime? date;
  String? unit;
  MeasureResponseModel(
      {required this.id, this.value, this.description, this.date, this.unit});

  factory MeasureResponseModel.fromJson(Map<String, dynamic> json) =>
      MeasureResponseModel(
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
