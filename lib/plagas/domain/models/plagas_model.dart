
import 'dart:convert';
import 'dart:typed_data';

List<Plaga> plagaFromJson(String str) => List<Plaga>.from(json.decode(str).map((x) => Plaga.fromJson(x)));

String plagaToJson(List<Plaga> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plaga {
    final int? id;
    final String? name;
    final String? description;
    final String? state;
    final String? observation;
    late final DateTime? appareceDate;
    final String? pestFamily;
    final String? stateTratment;
    final AdjuntoDto? adjuntoDto;
    late final Uint8List? image;

    Plaga({
         this.id,
         this.name,
         this.description,
         this.state,
         this.observation,
         this.appareceDate,
         this.pestFamily,
         this.stateTratment,
         this.adjuntoDto,
         this.image,
    });

    factory Plaga.fromJson(Map<String, dynamic> json) => Plaga(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        state: json["state"],
        observation: json["observation"],
        appareceDate: DateTime.parse(json["appareceDate"]),
        pestFamily: json["pestFamily"],
        stateTratment: json["state_tratment"],
        adjuntoDto: json["adjuntoDto"] == null ? null : AdjuntoDto.fromJson(json["adjuntoDto"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "state": state,
        "observation": observation,
        "appareceDate": "${appareceDate?.year.toString().padLeft(4, '0')}-${appareceDate?.month.toString().padLeft(2, '0')}-${appareceDate?.day.toString().padLeft(2, '0')}",
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
