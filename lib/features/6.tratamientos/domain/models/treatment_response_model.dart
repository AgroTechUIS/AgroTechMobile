// coverage:ignore-file
import 'dart:convert';

import '../../../5.plagas/domain/models/pest_response_model.dart';

List<TreatmentResponseModel> treatmentsFromJson(String str) =>
    List<TreatmentResponseModel>.from(json.decode(str)['treatments'].map((x) => TreatmentResponseModel.fromJson(x)));

String treatmentsToJson(List<TreatmentResponseModel> data) =>
    json.encode({'treatments': List<dynamic>.from(data.map((x) => x.toJson()))});

List<TreatmentResponseModel> listtreatmentFromJson(List<dynamic> datos) =>
    datos.map((e) => TreatmentResponseModel.fromJson(e)).toList();

class TreatmentResponseModel {
  int id;
  String? name;
  String? description;
  String? form;
  String? state;
  DateTime? dateStart;
  DateTime? dateEnd;
  int? pest;

  TreatmentResponseModel({
    required this.id,
    this.name,
    this.description,
    this.form,
    this.state,
    this.dateStart,
    this.dateEnd,
    this.pest,
  });

  factory TreatmentResponseModel.fromJson(Map<String, dynamic> json) => TreatmentResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        form: json["form"],
        state: json["state"],
        dateStart: DateTime.parse(json["date_start"]),
        dateEnd: DateTime.parse(json["date_end"]),
        // pest: json["pest"],
      );

  factory TreatmentResponseModel.fromJsonEdit(Map<String, dynamic> json) => TreatmentResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        form: json["form"],
        state: json["state"],
        dateStart: DateTime.parse(json["date_start"]),
        dateEnd: DateTime.parse(json["date_end"]),
        // pest: json["pest"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "form": form,
        "state": state,
        "date_start":
            "${dateStart?.year.toString().padLeft(4, '0')}-${dateStart?.month.toString().padLeft(2, '0')}-${dateStart?.day.toString().padLeft(2, '0')}",
        "date_end":
            "${dateEnd?.year.toString().padLeft(4, '0')}-${dateEnd?.month.toString().padLeft(2, '0')}-${dateEnd?.day.toString().padLeft(2, '0')}",
        "pest": pest,
      };
  Map<String, dynamic> toJsonPost() => {
        "id": null,
        "name": name,
        "description": description,
        "form": form,
        "state": state,
        "date_start":
            "${dateStart?.year.toString().padLeft(4, '0')}-${dateStart?.month.toString().padLeft(2, '0')}-${dateStart?.day.toString().padLeft(2, '0')}",
        "date_end":
            "${dateEnd?.year.toString().padLeft(4, '0')}-${dateEnd?.month.toString().padLeft(2, '0')}-${dateEnd?.day.toString().padLeft(2, '0')}",
        "pest": pest,
      };
}
