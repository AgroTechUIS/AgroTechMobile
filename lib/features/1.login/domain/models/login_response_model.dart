class LoginResponseModel {
  String? idusuario;
  String? nombre;
  String? cedula;
  String? email;
  String? telefono;
  String? rol;
  String? ingreso;
  String? token;
  int? idEmpresa;

  LoginResponseModel({
    this.idusuario,
    this.nombre,
    this.cedula,
    this.email,
    this.telefono,
    this.rol,
    this.ingreso,
    this.token,
    this.idEmpresa,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    idusuario = json["idUsuario"].toString();
    nombre = json["nombre"];
    cedula = json["cedula"];
    email = json["email"];
    telefono = json["telefono"];
    rol = json["roles"]["rol"];
    ingreso = json["ingreso"];
    token = json["token"];
    idEmpresa = json["idEmpresa"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idusuario"] = idusuario;
    data["nombre"] = nombre;
    data["cedula"] = cedula;
    data["correo"] = email;
    data["telefono"] = telefono;
    data["rol"] = rol;
    data["ingreso"] = ingreso;
    data["token"] = token;
    data["idEmpresa"] = idEmpresa;
    return data;
  }
}
