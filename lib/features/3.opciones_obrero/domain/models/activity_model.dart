class ActivityModel {
  int? id;
  String? nombre;
  String? finca;
  String? zona;
  String? fecha;
  String? estado;
  String? periodico;

  ActivityModel({
    this.id,
    this.nombre,
    this.finca,
    this.zona,
    this.fecha,
    this.estado,
    this.periodico,
  });

  ActivityModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nombre = json["nombre"];
    finca = json["finca"];
    zona = json["zona"];
    fecha = json["fecha"];
    estado = json["estado"];
    periodico = json["periodico"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["nombre"] = nombre;
    data["finca"] = finca;
    data["zona"] = zona;
    data["fecha"] = fecha;
    data["estado"] = estado;
    data["periodico"] = periodico;
    return data;
  }
}
