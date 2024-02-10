class NewActivityModel {
  String? nombre;
  String? descripcion;
  String? idUsuario;
  String? costo;

  NewActivityModel({
    this.nombre,
    this.descripcion,
    this.idUsuario,
    this.costo,
  });

  NewActivityModel.fromJson(Map<String, dynamic> json) {
    nombre = json["nombre"];
    descripcion = json["descripcion"];
    idUsuario = json["idUsuario"];
    costo = json["costo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nombre"] = nombre;
    data["descripcion"] = descripcion;
    data["idUsuario"] = idUsuario;
    data["costo"] = costo;
    return data;
  }
}
