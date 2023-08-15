class UserModel {
  String? idUsuario;

  UserModel({
    this.idUsuario,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    idUsuario = json["id_usuario"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id_usuario"] = idUsuario;
    return data;
  }
}
