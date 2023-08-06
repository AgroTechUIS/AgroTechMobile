import 'dart:convert';

class LoginResponseModel {
  String? hash;
  String? token;
  String? message;
  String? rol;
  String? error;

  LoginResponseModel({
    this.hash,
    this.token,
    this.message,
    this.rol,
    this.error,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    hash = json["hash"];
    token = json["token"];
    message = json["message"];
    rol = json["rol"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["hash"] = hash;
    data["token"] = token;
    data["message"] = message;
    data["rol"] = rol;
    return data;
  }
}
