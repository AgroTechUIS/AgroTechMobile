import 'dart:convert';
import 'dart:typed_data';

class Variables {
  int id = 0;
  String? name;
  String? description;
  String? method;
  DateTime? date;
  String? instrumento;
  Variables(
      {required this.id,
      this.name,
      this.description,
      this.method,
      this.date,
      this.instrumento});
}
