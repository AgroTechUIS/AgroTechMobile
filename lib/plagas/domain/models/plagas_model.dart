import 'dart:convert';

class Plaga {
  int idPlaga;
  String? nombrePlaga;
  String? descripcionPlaga;
  String? estadoPlaga;
  String? observacionPlaga;
  String? fechaPlaga;
  String? familiaPlaga;
  String? tratamientoPlaga;
  String? cropPlaga;

  Plaga({
    required this.idPlaga,
    this.nombrePlaga,
    this.descripcionPlaga,
    this.estadoPlaga,
    this.observacionPlaga,
    this.fechaPlaga,
    this.familiaPlaga,
    this.tratamientoPlaga,
    this.cropPlaga,
  });
}
