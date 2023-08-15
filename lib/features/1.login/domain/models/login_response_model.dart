class LoginResponseModel {
  String? idusuario;
  String? nombre;
  String? cedula;
  String? correo;
  String? telefono;
  String? rol;
  String? ingreso;
  String? token;
  String? error;

  LoginResponseModel({
    this.idusuario,
    this.nombre,
    this.cedula,
    this.correo,
    this.telefono,
    this.rol,
    this.ingreso,
    this.token,
    this.error,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    idusuario = json["idusuario"];
    nombre = json["nombre"];
    cedula = json["cedula"];
    correo = json["correo"];
    telefono = json["telefono"];
    rol = json["rol"];
    ingreso = json["ingreso"];
    token = json["token"];
    error = json["error"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idusuario"] = idusuario;
    data["nombre"] = nombre;
    data["cedula"] = cedula;
    data["correo"] = correo;
    data["telefono"] = telefono;
    data["rol"] = rol;
    data["ingreso"] = ingreso;
    data["token"] = token;
    data["error"] = error;
    return data;
  }
}
