// coverage:ignore-file
import 'dart:convert';
import 'dart:typed_data';

List<PlagaResponseModel> plagaFromJson(String str) =>
    List<PlagaResponseModel>.from(json.decode(str).map((x) => PlagaResponseModel.fromJson(x)));

String plagaToJson(List<PlagaResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<PlagaResponseModel> listplagaFromJson(List<dynamic> datos) =>
    datos.map((e) => PlagaResponseModel.fromJson(e)).toList();

class PlagaResponseModel {
  int? id;
  String? name;
  String? description;
  String? state;
  String? observation;
  DateTime? appareceDate;
  String? pestFamily;
  // AdjuntoDto? adjuntoDto;
  int? crop;
  PlagaResponseModel(
      {this.id,
      this.name,
      this.description,
      this.state,
      this.observation,
      this.appareceDate,
      this.pestFamily,
      //  this.adjuntoDto,
      this.crop});

  factory PlagaResponseModel.fromJson(Map<String, dynamic> json) => PlagaResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        state: json["state"],
        observation: json["observation"],
        appareceDate: DateTime.parse(json["appareceDate"]),
        pestFamily: json["pestFamily"],
        //  crop: json["crop"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "state": state,
        "observation": observation,
        "appareceDate":
            "${appareceDate?.year.toString().padLeft(4, '0')}-${appareceDate?.month.toString().padLeft(2, '0')}-${appareceDate?.day.toString().padLeft(2, '0')}",
        "pestFamily": pestFamily,
        "crop": crop
      };

  Map<String, dynamic> toJsonPost() => {
        "id": id,
        "name": name,
        "description": description,
        "state": state,
        "observation": observation,
        "appareceDate":
            "${appareceDate?.year.toString().padLeft(4, '0')}-${appareceDate?.month.toString().padLeft(2, '0')}-${appareceDate?.day.toString().padLeft(2, '0')}",
        "pestFamily": pestFamily,
        // "state_tratment": stateTratment,
        "crop": crop.toString()
      };
  Map<String, dynamic> toJsonEdit() => {
        "id": id,
        "name": name,
        "description": description,
        "state": state,
        "observation": observation,
        "appareceDate":
            "${appareceDate?.year.toString().padLeft(4, '0')}-${appareceDate?.month.toString().padLeft(2, '0')}-${appareceDate?.day.toString().padLeft(2, '0')}",
        "pestFamily": pestFamily,
        //- "url": adjuntoDto?.url ?? "",
      };
}

class AdjuntoDto {
  final int? id;
  final String? url;

  AdjuntoDto({
    required this.id,
    required this.url,
  });

  factory AdjuntoDto.fromJson(Map<String, dynamic> json) => AdjuntoDto(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
