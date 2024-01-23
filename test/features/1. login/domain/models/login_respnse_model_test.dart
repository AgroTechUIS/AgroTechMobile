import 'package:agrotech/features/1.login/domain/models/login_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginResponseModel', () {
    test('fromJson() should create a LoginResponseModel from a map', () {
      final Map<String, dynamic> json = {
        "idUsuario": "idusuario",
        "nombre": "nombre",
        "cedula": "cedula",
        "email": "email",
        "telefono": "telefono",
        "roles": {'rol': 'rol'},
        "ingreso": "ingreso",
        "token": "token",
        "idEmpresa": 0,
      };

      final response = LoginResponseModel.fromJson(json);

      expect(response.idusuario, "idusuario");
      expect(response.nombre, "nombre");
      expect(response.cedula, "cedula");
      expect(response.email, "email");
      expect(response.telefono, "telefono");
      expect(response.rol, "rol");
      expect(response.ingreso, "ingreso");
      expect(response.token, "token");
      expect(response.idEmpresa, 0);
    });

    test('toJson() should convert a LoginResponseModel to a map', () {
      final model = LoginResponseModel(
        idusuario: "idusuario",
        nombre: "nombre",
        cedula: "cedula",
        email: "email",
        telefono: "telefono",
        rol: "rol",
        ingreso: "ingreso",
        token: "token",
        idEmpresa: 0,
      );

      final json = model.toJson();
      expect(json["idUsuario"], "idusuario");
      expect(json["nombre"], "nombre");
      expect(json["cedula"], "cedula");
      expect(json["email"], "email");
      expect(json["telefono"], "telefono");
      expect(json["rol"], "rol");
      expect(json["ingreso"], "ingreso");
      expect(json["token"], "token");
      expect(json["idEmpresa"], 0);
    });
  });
}
