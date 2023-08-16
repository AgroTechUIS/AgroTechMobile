import 'dart:convert';
import 'dart:typed_data';

class Tratamiento {
  int id;
  String? name;
  String? description;
  String? state;
  String? instructions;
  DateTime? initialDate;
  DateTime? finalDate;

  Tratamiento(
      {required this.id,
      this.name,
      this.description,
      this.state,
      this.instructions,
      this.initialDate,
      this.finalDate});
}
