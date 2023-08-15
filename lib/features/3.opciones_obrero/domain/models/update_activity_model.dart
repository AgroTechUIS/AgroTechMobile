class UpdateActivityModel {
  int? idActividad;
  String? estado;
  String? descripcion;

  UpdateActivityModel({
    this.idActividad,
    this.estado,
    this.descripcion,
  });

  UpdateActivityModel.fromJson(Map<String, dynamic> json) {
    idActividad = json["idActividad"];
    estado = json["estado"];
    descripcion = json["descripcion"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idActividad"] = idActividad;
    data["estado"] = estado;
    data["descripcion"] = descripcion;
    return data;
  }
}
