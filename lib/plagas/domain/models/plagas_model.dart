import 'dart:convert';
import 'dart:typed_data';

class Plaga {
  int id;
  String? name;
  String? description;
  String? state;
  String? observation;
  DateTime? appareceDate;
  String? pestFamily;
  String? state_tratment;
  String? crop;
  Uint8List? image;

  Plaga(
      {required this.id,
      this.name,
      this.description,
      this.state,
      this.observation,
      this.appareceDate,
      this.pestFamily,
      this.state_tratment,
      this.crop,
      this.image});
}
