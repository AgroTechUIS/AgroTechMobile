// coverage:ignore-file
import 'dart:convert';

List<VariableResponseModel> variableFromJson(String str) =>
    List<VariableResponseModel>.from(json.decode(str).map((x) => VariableResponseModel.fromJson(x)));

String variableToJson(List<VariableResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<VariableResponseModel> listvariableFromJson(List<dynamic> datos) =>
    datos.map((e) => VariableResponseModel.fromJson(e)).toList();

class VariableResponseModel {
  int? id;
  String? name;
  String? description;
  String? measurement_method;
  DateTime? date_init;
  String? measuring_instrument;
  int? crop;

  VariableResponseModel(
      {this.id,
      this.name,
      this.description,
      this.measurement_method,
      this.date_init,
      this.measuring_instrument,
      this.crop});

  factory VariableResponseModel.fromJson(Map<String, dynamic> json) => VariableResponseModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      measurement_method: json["measurement_method"],
      date_init: json["date_init"] != null ? DateTime.parse(json["date_init"]) : null,
      measuring_instrument: json["measuring_instrument"],
      crop: json["crop"]);
  factory VariableResponseModel.fromJsonPost(Map<String, dynamic> json) => VariableResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        measurement_method: json["measurement_method"],
        date_init: DateTime.parse(json["date_init"]),
        measuring_instrument: json["measuring_instrument"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "measurement_method": measurement_method,
        "date_init": date_init?.toIso8601String(),
        "measuring_instrument": measuring_instrument,
      };

  Map<String, dynamic> toJsonEdit() => {
        "id": id,
        "name": name,
        "description": description,
        "measurement_method": measurement_method,
        "date_init": date_init?.toIso8601String(),
        "measuring_instrument": measuring_instrument,
      };

  Map<String, dynamic> toJsonPost() => {
        "name": name,
        "description": description,
        "measurement_method": measurement_method,
        "date_init": date_init?.toIso8601String(),
        "measuring_instrument": measuring_instrument,
        "crop": crop
      };
}
