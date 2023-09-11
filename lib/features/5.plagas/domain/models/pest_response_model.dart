import 'dart:convert';
import 'dart:typed_data';

List<PlagaResponseModel> plagaFromJson(String str) =>
    List<PlagaResponseModel>.from(
        json.decode(str).map((x) => PlagaResponseModel.fromJson(x)));

String plagaToJson(List<PlagaResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<PlagaResponseModel> listplagaFromJson(List<dynamic> datos) =>
    datos.map((e) => PlagaResponseModel.fromJson(e)).toList();

class PlagaResponseModel {
  final int? id;
  late final String? name;
  late final String? description;
  late final String? state;
  late final String? observation;
  late final DateTime? appareceDate;
  late final String? pestFamily;
  late final String? stateTratment;
  late final AdjuntoDto? adjuntoDto;
  late final int? crop;
  PlagaResponseModel(
      {this.id,
      this.name,
      this.description,
      this.state,
      this.observation,
      this.appareceDate,
      this.pestFamily,
      this.stateTratment,
      this.adjuntoDto,
      this.crop});

  factory PlagaResponseModel.fromJson(Map<String, dynamic> json) =>
      PlagaResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        state: json["state"],
        observation: json["observation"],
        appareceDate: DateTime.parse(json["appareceDate"]),
        pestFamily: json["pestFamily"],
        stateTratment: json["state_tratment"],
        adjuntoDto: json["adjuntoDto"] == null
            ? null
            : AdjuntoDto.fromJson(json["adjuntoDto"]),
        crop: json["crop"],
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
        "state_tratment": stateTratment,
        "adjuntoDto": adjuntoDto?.toJson(),
        "crop": crop
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
