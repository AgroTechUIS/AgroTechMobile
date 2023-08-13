import 'dart:convert';

class Plaga {
  int id;
  String? name;
  String? description;
  String? state;
  String? observation;
  String? appareceDate;
  String? pestFamily;
  String? state_tratment;
  String? crop;

  Plaga({
    required this.id,
    this.name,
    this.description,
    this.state,
    this.observation,
    this.appareceDate,
    this.pestFamily,
    this.state_tratment,
    this.crop,
  });
}
