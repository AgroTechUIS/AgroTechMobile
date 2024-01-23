// coverage:ignore-file
import 'dart:convert';

import 'package:agrotech/features/5.plagas/domain/models/pest_response_model.dart';

List<TreatmentModel> treatmentsFromJson(String str) =>
    List<TreatmentModel>.from(json.decode(str)['treatments'].map((x) => TreatmentModel.fromJson(x)));

String treatmentsToJson(List<TreatmentModel> data) =>
    json.encode({'treatments': List<dynamic>.from(data.map((x) => x.toJson()))});

class TreatmentModel {
  int id;
  String? name;
  String? description;
  String? form;
  String? state;
  String? observation;
  DateTime? dateStart;
  DateTime? dateEnd;
  PlagaResponseModel? pest;

  TreatmentModel({
    required this.id,
    this.name,
    this.description,
    this.form,
    this.state,
    this.observation,
    this.dateStart,
    this.dateEnd,
    this.pest,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> json) => TreatmentModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        form: json["form"],
        state: json["state"],
        observation: json["observation"],
        dateStart: DateTime.parse(json["date_start"]),
        dateEnd: DateTime.parse(json["date_end"]),
        pest: PlagaResponseModel.fromJson(json["pest"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "form": form,
        "state": state,
        "observation": observation,
        "date_start":
            "${dateStart?.year.toString().padLeft(4, '0')}-${dateStart?.month.toString().padLeft(2, '0')}-${dateStart?.day.toString().padLeft(2, '0')}",
        "date_end":
            "${dateEnd?.year.toString().padLeft(4, '0')}-${dateEnd?.month.toString().padLeft(2, '0')}-${dateEnd?.day.toString().padLeft(2, '0')}",
        "pest": pest?.toJson(),
      };
}
