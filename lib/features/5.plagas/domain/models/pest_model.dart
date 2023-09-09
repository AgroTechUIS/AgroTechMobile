import 'dart:convert';
import 'dart:typed_data';

List<PlagaModel> plagaFromJson(String str) =>
    List<PlagaModel>.from(json.decode(str).map((x) => PlagaModel.fromJson(x)));

String plagaToJson(List<PlagaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlagaModel {
  final int? id;
  final String? name;
  final String? description;
  final String? state;
  final String? observation;
  late final DateTime? appareceDate;
  final String? pestFamily;
  final String? stateTratment;
  final AdjuntoDto? adjuntoDto;

  PlagaModel({
    this.id,
    this.name,
    this.description,
    this.state,
    this.observation,
    this.appareceDate,
    this.pestFamily,
    this.stateTratment,
    this.adjuntoDto,
  });

  factory PlagaModel.fromJson(Map<String, dynamic> json) => PlagaModel(
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
      };
}

class AdjuntoDto {
  final int id;
  final String url;

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
