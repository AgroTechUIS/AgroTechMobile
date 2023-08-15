class CropModel {
  int? idCiltivo;
  String? planta;
  String? finca;
  String? direccion;
  String? zona;
  String? fechaInicio;
  String? fechaFin;

  CropModel({
    this.idCiltivo,
    this.planta,
    this.finca,
    this.direccion,
    this.zona,
    this.fechaInicio,
    this.fechaFin,
  });

  CropModel.fromJson(Map<String, dynamic> json) {
    idCiltivo = json["idCiltivo"];
    planta = json["planta"];
    finca = json["finca"];
    direccion = json["direccion"];
    zona = json["zona"];
    fechaInicio = json["fechaInicio"];
    fechaFin = json["fechaFin"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idCiltivo"] = idCiltivo;
    data["planta"] = planta;
    data["finca"] = finca;
    data["direccion"] = direccion;
    data["zona"] = zona;
    data["fechaInicio"] = fechaInicio;
    data["fechaFin"] = fechaFin;
    return data;
  }
}
