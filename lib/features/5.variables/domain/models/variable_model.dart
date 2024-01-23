// coverage:ignore-file
import 'dart:convert';

List<VariableModel> variableFromJson(String str) =>
    List<VariableModel>.from(json.decode(str).map((x) => VariableModel.fromJson(x)));

String variableToJson(List<VariableModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<VariableModel> listvariableFromJson(List<dynamic> datos) => datos.map((e) => VariableModel.fromJson(e)).toList();

class VariableModel {
  int id = 0;
  String? name;
  String? description;
  String? method;
  DateTime? date;
  String? instrumento;

  VariableModel({
    required this.id,
    this.name,
    this.description,
    this.method,
    this.date,
    this.instrumento,
  });

  factory VariableModel.fromJson(Map<String, dynamic> json) => VariableModel(
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
