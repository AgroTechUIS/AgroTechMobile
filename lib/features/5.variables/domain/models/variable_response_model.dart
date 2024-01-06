import 'dart:convert';

List<VariableResponseModel> variableFromJson(String str) =>
    List<VariableResponseModel>.from(
        json.decode(str).map((x) => VariableResponseModel.fromJson(x)));

String variableToJson(List<VariableResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<VariableResponseModel> listvariableFromJson(List<dynamic> datos) =>
    datos.map((e) => VariableResponseModel.fromJson(e)).toList();

class VariableResponseModel {
  int id = 0;
  String? name;
  String? description;
  String? method;
  DateTime? date;
  String? instrumento;

  VariableResponseModel({
    required this.id,
    this.name,
    this.description,
    this.method,
    this.date,
    this.instrumento,
  });

  factory VariableResponseModel.fromJson(Map<String, dynamic> json) =>
      VariableResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        method: json["method"],
        date: json["date"] != null ? DateTime.parse(json["date"]) : null,
        instrumento: json["instrumento"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "method": method,
        "date": date?.toIso8601String(),
        "instrumento": instrumento,
      };
}
