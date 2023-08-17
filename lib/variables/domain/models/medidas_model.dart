import 'dart:convert';
import 'dart:typed_data';

class Medidas {
  int id = 0;
  int? value;
  String? description;
  DateTime? date;
  String? unit;
  Medidas(
      {required this.id, this.value, this.description, this.date, this.unit});
}
