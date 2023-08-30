import 'dart:convert';

List<TreatmentResponseModel> treatmentFromJson(String str) =>
    List<TreatmentResponseModel>.from(
        json.decode(str).map((x) => TreatmentResponseModel.fromJson(x)));

String treatmentToJson(List<TreatmentResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<TreatmentResponseModel> listtreatmentFromJson(List<dynamic> datos) =>
    datos.map((e) => TreatmentResponseModel.fromJson(e)).toList();

class TreatmentResponseModel {
  int id;
  String? name;
  String? description;
  String? state;
  String? instructions;
  DateTime? initialDate;
  DateTime? finalDate;

  TreatmentResponseModel(
      {required this.id,
      this.name,
      this.description,
      this.state,
      this.instructions,
      this.initialDate,
      this.finalDate});

  factory TreatmentResponseModel.fromJson(Map<String, dynamic> json) =>
      TreatmentResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        state: json["state"],
        instructions: json["observation"],
        initialDate: DateTime.parse(json["appareceDate"]),
        finalDate:
            null, // You might need to modify this based on your data source
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "state": state,
        "observation": instructions, // Make sure to adjust this if needed
        "appareceDate":
            "${initialDate?.year.toString().padLeft(4, '0')}-${initialDate?.month.toString().padLeft(2, '0')}-${initialDate?.day.toString().padLeft(2, '0')}",
        // Add other fields here if needed
      };
}
