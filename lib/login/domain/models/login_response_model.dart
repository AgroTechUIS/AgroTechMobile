import 'dart:convert';

class LoginResponseModel {
  String? hash;
  String? token;
  String? message;
  String? rol;

  LoginResponseModel({
    this.hash,
    this.token,
    this.message,
    this.rol,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    hash = json["hash"];
    token = json["token"];
    message = json["message"];
    rol = json["rol"];
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["hash"] = hash;
    data["token"] = token;
    data["message"] = message;
    data["rol"] = rol;
    return jsonEncode(data);
  }
}
