class WorkerModel {
  String? nombre;
  String? apellido;
  String? cedula;
  String? correo;

  WorkerModel({
    this.nombre,
    this.apellido,
    this.cedula,
    this.correo,
  });

  WorkerModel.fromJson(Map<String, dynamic> json) {
    nombre = json["nombre"];
    apellido = json["apellido"];
    cedula = json["cedula"];
    correo = json["correo"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nombre"] = nombre;
    data["apellido"] = apellido;
    data["cedula"] = cedula;
    data["correo"] = correo;
    return data;
  }
}
